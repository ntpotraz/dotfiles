-- Completion engine (saghen/blink.cmp)

require("blink.cmp").setup({
  -- Change preset to "super-tab", "enter", or customize keys in your own config:
  -- "default" uses standard Vim keys (<C-y> accept, <C-n>/<C-p> select, <C-space> menu).
  keymap = { preset = "default" },

  appearance = {
    nerd_font_variant = "mono",
  },

  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },

  signature = {
    enabled = true,
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },

  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },
})
