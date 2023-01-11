local builtin = require('telescope.builtin')
vim.keymap.set('n', ';f', builtin.find_files, {})
vim.keymap.set('n', ';r', builtin.live_grep, {})
vim.keymap.set('n', ';;', builtin.buffers, {})
vim.keymap.set('n', ';h', builtin.help_tags, {})

-- TELESCOPE FILE BROWSER
-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
local fb_actions = require"telescope".extensions.file_browser.actions
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
	  ["R"] = fb_actions.rename,
	  ["N"] = fb_actions.create
        },
      },
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"

vim.keymap.set('n', 'sf', ':Telescope file_browser initial_mode=normal<Cr>', { noremap = true })
