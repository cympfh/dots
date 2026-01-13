local function on_attach(client, bufnr)
  -- Key mappings for LSP features
  local opts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<c-g>q', vim.diagnostic.setqflist, opts)
  -- vim.keymap.set('n', '<C-g><C-p>', vim.diagnostic.goto_prev, opts)
  -- vim.keymap.set('n', '<C-g><C-n>', vim.diagnostic.goto_next, opts)
  -- Auto-format on save
  if client.name == 'ruff' or client.name == 'rust-analyzer' then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false, id = client.id })
      end,
    })
  end
end

-- Python (ruff, ty)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function(args)
    local root_dir = vim.fs.root(args.buf, {".git", "pyproject.toml", "setup.py"}) or vim.loop.cwd()
    vim.lsp.start({
      name = 'ruff',
      cmd = { 'ruff', 'server' },
      root_dir = root_dir,
      single_file_support = true,
      settings = {
        -- Ruff config here
      },
      on_attach = on_attach,
    })
    vim.lsp.start({
      name = 'ty',
      cmd = { 'ty', 'server' },
      root_dir = root_dir,
      settings = {
        ty = {
          -- Ty config here
        }
      },
      on_attach = on_attach,
    })
  end,
})

-- Rust (rust-analyzer)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function(args)
    local root_dir = vim.fs.root(args.buf, {"Cargo.toml", ".git"}) or vim.loop.cwd()
    vim.lsp.start({
      name = 'rust-analyzer',
      cmd = { 'rust-analyzer' },
      root_dir = root_dir,
      settings = {
        ['rust-analyzer'] = {
          check = {
            command = "clippy",
          },
        },
      },
      on_attach = on_attach,
    })
  end,
})

vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    vim.diagnostic.setqflist({ open = false })
    local diagnostics = vim.diagnostic.get()
    if #diagnostics == 0 then
      vim.cmd.cclose()
    end

  end,
})
vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = true,
  signs = true,
  underline = false,
  update_in_insert = false,
})
