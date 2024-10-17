return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    {
      "williamboman/mason.nvim",
      opts = {},
      keys = {
        vim.keymap.set("n", "<leader>cm", "<CMD>Mason<CR>"),
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

    -- Define LSP keymaps function
    local function setup_lsp_keymaps(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- Hover documentation
      vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

      -- Navigation
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

      -- Workspace management
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)

      -- Code actions and refactoring
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      -- Diagnostics
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

      -- Format
      if client.supports_method("textDocument/formatting") then
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end
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

    lsp.html.setup(vim.tbl_deep_extend("force", default_config, {
      filetypes = { "html" },
      init_options = {
        provideFormatter = false,
      },
    }))

    lsp.emmet_language_server.setup(vim.tbl_deep_extend("force", default_config, {
      filetypes = { "html" },
    }))

    lsp.cssls.setup(vim.tbl_deep_extend("force", default_config, {
      filetypes = { "css" },
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
