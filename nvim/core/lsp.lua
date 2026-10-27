-- サーバー定義は ~/.dots/nvim/lsp/<name>.lua （runtimepath 自動検出）
vim.lsp.enable({ 'ruff', 'ty', 'rust-analyzer', 'taplo' })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = args.buf

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    end

    -- Key mappings for LSP features
    local opts = { buffer = bufnr, noremap = true, silent = true }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<c-g>q', vim.diagnostic.setqflist, opts) -- manually set quickfix
    -- vim.keymap.set('n', '<C-g><C-p>', function() vim.diagnostic.jump({ count = -1 }) end, opts)
    -- vim.keymap.set('n', '<C-g><C-n>', function() vim.diagnostic.jump({ count = 1 }) end, opts)

    -- Auto-format on save
    if client.name == 'ruff' then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.code_action({
            context = { only = { 'source.organizeImports' }, diagnostics = {} },
            apply = true,
          })
          vim.lsp.buf.format({ async = false, id = client.id })
        end,
      })
    elseif client.name == 'rust-analyzer' then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false, id = client.id })
        end,
      })
    elseif client.name == 'taplo' then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          -- 除外された文書は LSP が編集を返さない。そのときは taplo format に渡す
          local before = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), '\n')
          vim.lsp.buf.format({
            async = false,
            id = client.id,
            timeout_ms = 2000,
            bufnr = bufnr,
          })
          local after = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), '\n')
          if after ~= before then
            return
          end
          local text = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), '\n') .. '\n'
          local result = vim.system({ 'taplo', 'format', '-' }, { text = true, stdin = text }):wait()
          if result.code == 0 and result.stdout and result.stdout ~= '' then
            local lines = vim.split(result.stdout, '\n', { plain = true })
            if lines[#lines] == '' then
              table.remove(lines)
            end
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
          end
        end,
      })
    end
  end,
})

vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    vim.schedule(function()
      vim.diagnostic.setqflist({ open = false })
      local diagnostics = vim.diagnostic.get()
      if #diagnostics == 0 then
        vim.cmd.cclose()
      end
    end)
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = true,
  signs = true,
  underline = false,
  update_in_insert = false,
})
