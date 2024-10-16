return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  event = "VimEnter",
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()

    require("telescope").setup {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          width = .7,
          height = .8,
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
        buffers = {
          mappings = {
            n = {
              ['dd'] = "delete_buffer",
            },
          },
        },
      },
    }

    local builtin = require("telescope.builtin")
    local keymap = vim.keymap.set

    keymap("n", "'f", builtin.find_files, { desc = "[F]ind files" })
    keymap("n", "'r", builtin.live_grep, { desc = "Live G[r]ep" })
    keymap("n", "<leader><space>", builtin.buffers, { desc = "Buffers" })
  end,
}
