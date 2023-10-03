local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function(_, opts)
      require("core.utils").load_mappings "tmux"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "mypy",
        "ruff",
        "black",
        "debugpy",
        "lua-language-server",
        "typescript-language-server",
        "json-lsp",
        "css-lsp",
        "eslint_d",
        "clangd",
        "clang-format",
        "html-lsp",
        "marksman",
        "prettierd",
        "stylua",
        "rust-analyzer",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.treesitter"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },

  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings "dap"
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings "dap_python"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}

return plugins
