return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    local neovimFiles = function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end

    vim.keymap.set('n', "'f", builtin.find_files, { desc = "[F]ind files" })
    vim.keymap.set('n', "'r", builtin.live_grep, { desc = "Live G[r]ep" })
    vim.keymap.set('n', "<leader><space>", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set('n', "<leader>sn", neovimFiles, { desc = "[S]earch [N]eovim files" })

    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          width = 0.7,
          height = 0.8,
          horizontal = {
            preview_width = 0.5,
          },
        },
        initial_mode = "normal",
        mappings = {
          n = {
            ["q"] = "close",
          },
        },
      },

      pickers = {
        find_files = {
          initial_mode = "insert",
        },
        live_grep = {
          initial_mode = "insert",
        },
        buffers = {
          mappings = {
            n = {
              ["dd"] = "delete_buffer",
            },
          },
        },
      },
    })
  end,
}
