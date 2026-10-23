-- lazy.nvim
return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = true
    },
    lsp = {
      signature = {
        enabled = false,
        auto_open = {
          enabled = false
        },
        opts = {
          win_options = {
            max_width = 5,
          },
        },
      },
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
}
