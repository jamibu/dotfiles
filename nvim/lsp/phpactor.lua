---@type vim.lsp.Config
return {
  -- composer.json first: root lands on the real PHP project (e.g. backend/),
  -- even inside a monorepo where ../.git would otherwise win.
  root_markers = { 'composer.json', '.git', '.phpactor.json', '.phpactor.yml' },
  init_options = {
    ['language_server_phpstan.enabled'] = true,
    ['language_server_phpstan.tmp_file_disabled'] = true,
  },
}
