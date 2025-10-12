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
      ["<Tab>"] = {
        "snippet_forward",
        function() -- sidekick next edit suggestion
          return require("sidekick").nes_jump_or_apply()
        end,
        function() -- if you are using Neovim's native inline completions
          return vim.lsp.inline_completion.get()
        end,
        "fallback",
      },
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
      trigger = { enabled = true,
        show_on_keyword = false,
        show_on_trigger_character = false,
        show_on_insert = false,
        show_on_insert_on_trigger_character = true,
      },
    },
  },
  opts_extend = { 'sources.default' },
}
