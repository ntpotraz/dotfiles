local M = {}
-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<ESC>"] = "",
    ["K"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",
    ["<C-h>"] = "",
  },

  i = {},

  v = {},

  t = {},
}

-- Your custom mappings
M.general = {
  n = {
    -- Escape clears highlights
    ["<Esc>"] = { ":noh <CR>", "Clear highlights", opts = { silent = true } },

    -- Splits
    ["ss"] = { ":sp<CR>", "Split horizontally", opts = { silent = true } },
    ["sv"] = { ":vsp<CR>", "Split vertically", opts = { silent = true } },

    -- Select all
    ["<C-a>"] = { "gg<S-v>G", "Select all", opts = { silent = true } },

    -- Move 5
    ["J"] = { "5j", "Move down 5", opts = { silent = true } },
    ["K"] = { "5k", "Move up 5", opts = { silent = true } },

    -- Set lsp hover
    ["gh"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["<leader>q"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    -- Increment/Decrement
    ["<leader>a"] = { "<C-a>", "Increment up by 1", opts = { silent = true } },
    ["<leader>x"] = { "<C-x>", "Increment down by 1", opts = { silent = true } },
  },

  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { silent = true } },
  },

  v = {},

  t = {
    ["kj"] = { "<C-\\><C-n>", opts = { silent = true } },
  },
}

M.telescope = {
  plugin = true,

  n = {
    ["'f"] = { "<cmd> Telescope find_files <CR>", "Find files", opts = { silent = true } },
    ["'r"] = { "<cmd> Telescope live_grep <CR>", "Live grep", opts = { silent = true } },
    ["''"] = { "<cmd> Telescope buffers <CR>", "Find buffers", opts = { silent = true } },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd>DapToggleBreakpoint<CR>" },
  },
}
M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

M.tmux = {
  plugin = true,
  n = {
    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", "Moves 1 pane left", opts = { silent = true } },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", "Moves 1 pane Down", opts = { silent = true } },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", "Moves 1 pane up", opts = { silent = true } },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", "Moves 1 pane right", opts = { silent = true } },
  },
}

return M
