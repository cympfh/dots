return {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'ruff.toml', '.ruff.toml', 'pyproject.toml', 'setup.py', '.git' },
  settings = {
    organizeImports = true,
  },
}
