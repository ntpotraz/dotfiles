local fb_actions = require "telescope._extensions.file_browser.actions"

require('telescope').setup {
  extensions = {
    file_browser = {
      theme = "dropdown",
      mappings = {
        ['n'] = {
          ['N'] = fb_actions.create,
          ['R'] = fb_actions.rename,
          ['D'] = fb_actions.remove,
        },
      },
    },
  },
}
require("telescope").load_extension "file_browser"

local builtin = require('telescope.builtin')
vim.keymap.set('n', "'f", builtin.find_files, {desc = 'Search [f]iles'})
vim.keymap.set('n', "'r", builtin.live_grep, {desc = 'Search by G[r]ep'})
vim.keymap.set('n', '<leader><space>', builtin.buffers, {desc = '[ ] Find existing buffers'})
vim.keymap.set('n', "'g", builtin.git_files, {desc = 'Search files in [g]it repo'})
vim.keymap.set('n', '<leader>sf', ":Telescope file_browser path=%:p:h select_buffer=true<CR><Esc>", {desc = '[S]earch [f]ile browser', noremap = true })
