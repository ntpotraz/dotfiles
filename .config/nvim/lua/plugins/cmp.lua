return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Sources
    "hrsh7th/cmp-buffer", -- Buffer completions
    "hrsh7th/cmp-path", -- Path completions
    "hrsh7th/cmp-cmdline", -- Cmdline completions
    "hrsh7th/cmp-nvim-lsp", -- LSP completions
    "hrsh7th/cmp-nvim-lua", -- Lua completions
    "saadparwaiz1/cmp_luasnip", -- Snippet completions

    -- Snippets
    "L3MON4D3/LuaSnip", -- Snippet engine
    "rafamadriz/friendly-snippets", -- Snippet collection
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Load snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = {
          border = "rounded",
          scrollbar = true,
          scrolloff = 2,
          side_padding = 1,
        },
        documentation = {
          border = "rounded",
          scrollbar = true,
          scrolloff = 2,
          side_padding = 1,
        }
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        fields = { "kind", "abbr", "menu" },
        expandable_indicator = true,
        format = function(entry, vim_item)
          -- Set menu icons
          local menu_icon = {
            nvim_lsp = "λ",
            luasnip = "⋗",
            buffer = "Ω",
            path = "🖫",
          }
          vim_item.menu = menu_icon[entry.source.name]
          return vim_item
        end,
      },
    })

    -- Command line completion
    -- cmp.setup.cmdline(":", {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = cmp.config.sources({
    --     { name = "path" },
    --     { name = "cmdline" },
    --   }),
    -- })

    -- Search completion
    -- cmp.setup.cmdline("/", {
    --   mapping = cmp.mapping.preset.cmdline(),
    --   sources = {
    --     { name = "buffer" },
    --   },
    -- })
  end,
}
