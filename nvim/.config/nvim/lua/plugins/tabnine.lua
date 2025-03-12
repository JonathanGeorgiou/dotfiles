local tabnine_enterprise_host = ''
return {
  'codota/tabnine-nvim',
  build = './dl_binaries.sh ' .. tabnine_enterprise_host .. '/update',
  config = function()
    require('tabnine').setup {
      disable_auto_comment = true,
      accept_keymap = '<C-y>',
      dismiss_keymap = '<C-]>',
      debounce_ms = 800,
      suggestion_color = { gui = '#808080', cterm = 244 },
      codelens_color = { gui = '#808080', cterm = 244 },
      codelens_enabled = true,
      exclude_filetypes = { 'TelescopePrompt', 'NvimTree' },
      log_file_path = nil,
      tabnine_enterprise_host = tabnine_enterprise_host,
      ignore_certificate_errors = true,
    }
  end,
}
