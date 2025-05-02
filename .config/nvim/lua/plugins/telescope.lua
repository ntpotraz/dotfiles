return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    local neovimFiles = function()
      builtin.find_files({cwd = vim.fn.stdpath('config') })
    end

    vim.keymap.set('n', '\'f', builtin.find_files, { desc = '[F]ind files' })
    vim.keymap.set('n', '\'r', builtin.live_grep, { desc = 'Live g[r]ep' })
    vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '\'h', builtin.help_tags, { desc = 'Telescope [h]elp tags' })
    vim.keymap.set('n', '\'c', neovimFiles, { desc = 'Search Neovim [c]onfig' })

    require('telescope').setup({
      defaults = {
        initial_mode = 'normal',
        layout_strategy = 'horizontal',
        layout_config = {
          width = 0.7,
          height = 0.8,
          horizontal = {
            preview_width = 0.5,
          },
        },
        mappings = {
          n = {
            ['q'] = 'close',
          },
          i = {
            ['<ESC>'] = 'close',
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
