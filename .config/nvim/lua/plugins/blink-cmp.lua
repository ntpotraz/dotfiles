return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },
    completion = {
      documentation = { auto_show = false },
      menu = {
        scrollbar = false,
        winblend = 0,
        border = 'rounded',
      },
      ghost_text = { enabled = true },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = {
      enabled = false,
      window = {
        show_documentation = false,
      },
    },
  },
  opts_extend = { 'sources.default' },
}
