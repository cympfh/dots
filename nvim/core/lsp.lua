-- サーバー定義は ~/.dots/nvim/lsp/<name>.lua （runtimepath 自動検出）
vim.lsp.enable({ 'ruff', 'ty', 'rust-analyzer' })

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
