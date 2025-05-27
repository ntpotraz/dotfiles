return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
      ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = 'mono',
    },
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      menu = {
        scrollbar = false,
        winblend = 0,
        border = 'rounded',
      },
      ghost_text = { enabled = true },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = {
      enabled = true,
      window = {
        show_documentation = true,
        border = 'rounded',
      },
    },
  },
  opts_extend = { 'sources.default' },
}
