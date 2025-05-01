local keymap = vim.keymap.set

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    {
      "williamboman/mason.nvim",
      opts = {},
      keys = {
        { "<leader>cm", "<CMD>Mason<CR>", desc = "[C]all [M]ason" },
      },
    },
    { "williamboman/mason-lspconfig.nvim", opts = {} },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          -- LSP
          "lua_ls",
          "html-lsp",
          "cssls",
          "ts_ls",
          "emmet_language_server",

          -- Formatters & Linters
          "stylua",
          "biome",
          "prettierd",
        },
      },
    },
    { "j-hui/fidget.nvim", opts = {} },
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      },
    },
    -- { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  },

  config = function()
    local lsp = require("lspconfig")

    vim.diagnostic.config({
      float = {
        max_width = 100,
        border = "single",
      },
    })

    -- vim.lsp.handlers["textDocument/completion"] = vim.lsp.with(vim.lsp.handlers.completion, {
    --   -- Use a sharp border with `FloatBorder` highlights
    --   border = "double",
    --   -- add the title in hover float window
    --   title = "hover",
    -- })
    --
    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    --   -- Use a sharp border with `FloatBorder` highlights
    --   border = "double",
    --   -- add the title in hover float window
    --   title = "hover",
    -- })
    --
    -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    --   -- Use a sharp border with `FloatBorder` highlights
    --   title = "Signature",
    --   border = "single",
    --   width = 10,
    -- })

    -- Define LSP keymaps function
    local function setup_lsp_keymaps(_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- Hover documentation
      keymap("n", "gh", vim.lsp.buf.hover, opts)
      keymap("n", "gk", vim.lsp.buf.signature_help, opts)

      -- Navigation
      keymap("n", "gd", vim.lsp.buf.definition, opts)
      keymap("n", "gD", vim.lsp.buf.declaration, opts)
      keymap("n", "gi", vim.lsp.buf.implementation, opts)
      keymap("n", "gr", vim.lsp.buf.references, opts)
      keymap("n", "gt", vim.lsp.buf.type_definition, opts)

      -- Workspace management
      keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
      keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
      keymap("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)

      -- Code actions and refactoring
      keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

      -- Diagnostics
      keymap("n", "[d", vim.diagnostic.goto_prev, opts)
      keymap("n", "]d", vim.diagnostic.goto_next, opts)
      keymap("n", "<leader>f", vim.diagnostic.open_float, opts)
      keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)
    end

    -- Default LSP config to apply to all servers
    local default_config = {
      on_attach = setup_lsp_keymaps,
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    }

    -- Server specific setups with defaults merged in
    lsp.lua_ls.setup(vim.tbl_deep_extend("force", default_config, {
      filetypes = { "lua" },
    }))

    lsp.hyprls.setup(vim.tbl_deep_extend("force", default_config, {
      pattern = { "hypr*.ocnf" },
    }))

    lsp.html.setup(vim.tbl_deep_extend("force", default_config, {
      filetypes = { "html" },
      init_options = {
        provideFormatter = false,
      },
    }))

    lsp.emmet_language_server.setup(vim.tbl_deep_extend("force", default_config, {
      filetypes = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
      },
    }))

    lsp.cssls.setup(vim.tbl_deep_extend("force", default_config, {
      filetypes = { "css" },
      init_options = {
        provideFormatter = false,
      },
    }))

    lsp.ts_ls.setup(vim.tbl_deep_extend("force", default_config, {
      filetypes = {
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
      },
    }))
  end,
}
