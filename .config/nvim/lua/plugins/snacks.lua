return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  dependencies = {
    { 'folke/persistence.nvim', event = 'BufReadPre', opts = {} },
  },
  keys = {
    -- Picker
    { "'f", function() Snacks.picker.files() end, desc = '[F]ind Files', },
    { '<leader><space>', function() Snacks.picker.buffers() end, desc = 'Search Buffers', },
    { "'r", function() Snacks.picker.grep() end, desc = 'G[r]ep Search', },
    { "'c", function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end, desc = 'Search Config Files', },
    { "'h", function() Snacks.picker.help() end, desc = '[H]elp Pages', },
    { "'n", function() Snacks.picker.notifications() end, desc = '[N]otification history', },
    { "'e", function() Snacks.explorer() end, desc = '[E]xplorer', },

    -- Git
    { '<leader>gb', function() Snacks.git.blame_line() end, desc = '[G]it [B]lame' },
    { '<leader>go', function() Snacks.gitbrowse() end, desc = '[G]it Repo [O]pen' },
    { '<leader>gg', function() Snacks.lazygit() end, desc = 'LazyGit' },
    { '<leader>gd', function() Snacks.picker.git_diff() end, desc = 'Git Diffs' },

    -- LSP
    { 'gd', function() Snacks.picker.lsp_definitions() end, desc = 'Goto Definition' },
    { 'gD', function() Snacks.picker.lsp_declarations() end, desc =  'Goto Declaration' },
    { 'gr', function() Snacks.picker.lsp_references() end, nowait = true, desc = 'References' },
    { 'gI', function() Snacks.picker.lsp_implementations() end, desc = 'Goto Implementation' },
    { 'gy', function() Snacks.picker.lsp_type_definitions() end, desc = 'Goto T[y]pe Definition' },

    -- Movement
    { ']]', function() Snacks.words.jump() end, desc = 'Jump to next instance of word' },
    { '[[', function() Snacks.words.jump(-1) end, desc = 'Jump to previous instance of word' },

    -- Zen
    { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },

    -- Terminal
    { '<leader>t', function() Snacks.terminal() end, desc = 'Open [T]erminal' },
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below

    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { icon = ' ', key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", action = ':lua require("persistence").load()', section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
______________________________________/\\\_______________________________
 _____________________________________\/\\\_______________________________
  _____________________________________\/\\\_______________________________
   _____/\\\\\\\\__/\\\\\\\\\___________\/\\\___/\\/\\\\\\\___/\\\\\\\\\____
    ___/\\\//////__\////////\\\_____/\\\\\\\\\__\/\\\/////\\\_\////////\\\___
     __/\\\___________/\\\\\\\\\\___/\\\////\\\__\/\\\___\///____/\\\\\\\\\\__
      _\//\\\_________/\\\/////\\\__\/\\\__\/\\\__\/\\\__________/\\\/////\\\__
       __\///\\\\\\\\_\//\\\\\\\\/\\_\//\\\\\\\/\\_\/\\\_________\//\\\\\\\\/\\_
        ____\////////___\////////\//___\///////\//__\///___________\////////\//__
ntpotraz@github 
  ]],
      },
    },

    picker = {
      win = {
        input = {
          keys = {
            ['<ESC>'] = { 'close', mode = { 'n', 'i' } },
          },
        },
      },
      enabled = true,
      sources = {
        buffers = {
          focus = 'list',
        },
        git_diff = {
          focus = 'list',
        },
        explorer = {
          layout = {
            layout = {
              position = 'right',
            },
          },
        },
      },
    },
    zen = {
      enabled = true,
      win = {
        wo = {
          number = false,
          relativenumber= false,
          colorcolumn = "",
          signcolumn = "no",
          statuscolumn = "",
        },
      },
      on_open = function ()
       Snacks.indent.disable()
      end,
      on_close = function ()
         Snacks.indent.enable()
      end,
    },

    bigfile = { enabled = true },
    quickfile = { enabled = true },
    explorer = { enabled = true },
    image = {
      enabled = true,
      doc = {
        max_width = 10,
        max_height = 5,
      }
    },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    lazygit = { enabled = true },
    statuscolumn = { enabled = true },
    notifier = { enabled = true },
    notify = { enabled = true },
    input = { enabled = true },
    rename = { enabled = true },
    scope = { enabled = true },
    indent = { enabled = true },
    words = { enabled = true },
  },
}
