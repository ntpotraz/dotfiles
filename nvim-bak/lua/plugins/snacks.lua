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
    {
      "'f",
      function()
        Snacks.picker.files()
      end,
      desc = '[F]ind Files',
    },
    {
      '<leader><space>',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Search Buffers',
    },
    {
      "'r",
      function()
        Snacks.picker.grep()
      end,
      desc = 'G[r]ep Search',
    },
    {
      "'c",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath('config') })
      end,
      desc = 'Search Config Files',
    },
    {
      "'h",
      function()
        Snacks.picker.help()
      end,
      desc = '[H]elp Pages',
    },
    {
      "'n",
      function()
        Snacks.picker.notifications()
      end,
      desc = '[N]otification history',
    },
    {
      "'e",
      function()
        Snacks.explorer()
      end,
      desc = '[E]xplorer',
    },

    -- Git
    {
      '<leader>gb',
      function()
        Snacks.git.blame_line()
      end,
      desc = '[G]it [B]lame',
    },
    {
      '<leader>go',
      function()
        Snacks.gitbrowse()
      end,
      desc = '[G]it Repo [O]pen',
    },
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'LazyGit',
    },
    {
      '<leader>gd',
      function()
        Snacks.picker.git_diff()
      end,
      desc = 'Git Diffs',
    },

    -- LSP
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = 'Goto Definition',
    },
    {
      'gD',
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = 'Goto Declaration',
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = 'References',
    },
    {
      'gI',
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = 'Goto Implementation',
    },
    {
      'gy',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = 'Goto T[y]pe Definition',
    },

    -- Movement
    {
      ']]',
      function()
        Snacks.words.jump()
      end,
      desc = 'Jump to next instance of word',
    },
    {
      '[[',
      function()
        Snacks.words.jump(-1)
      end,
      desc = 'Jump to previous instance of word',
    },

    -- Zen
    {
      '<leader>z',
      function()
        Snacks.zen()
      end,
      desc = 'Toggle Zen Mode',
    },
    {
      '<leader>Z',
      function()
        Snacks.zen.zoom()
      end,
      desc = 'Toggle Zoom',
    },

    -- Terminal
    {
      '<leader>tt',
      function()
        Snacks.terminal(nil, { win = { position = 'float', border = true } })
      end,
      desc = 'Open [T]erminal',
    },
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below

    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = ' ',
            key = 'c',
            desc = 'Config',
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          {
            icon = ' ',
            key = 's',
            desc = 'Restore Session',
            action = ':lua require("persistence").load()',
            section = 'session',
          },
          { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
        header = [[
__/\\\________/\\\__/\\\\\\\\\\\\\\\__/\\\________/\\\_____/\\\\\\\\\\\____/\\\\\\\\\\\_____/\\\\\\\\\\\\__/\\\________/\\\__/\\\\\\\\\\\\\\\_        
 _\/\\\_____/\\\//__\/\\\///////////__\///\\\____/\\\/____/\\\/////////\\\_\/////\\\///____/\\\//////////__\/\\\_______\/\\\_\///////\\\/////__       
  _\/\\\__/\\\//_____\/\\\_______________\///\\\/\\\/_____\//\\\______\///______\/\\\______/\\\_____________\/\\\_______\/\\\_______\/\\\_______      
   _\/\\\\\\//\\\_____\/\\\\\\\\\\\_________\///\\\/________\////\\\_____________\/\\\_____\/\\\____/\\\\\\\_\/\\\\\\\\\\\\\\\_______\/\\\_______     
    _\/\\\//_\//\\\____\/\\\///////____________\/\\\____________\////\\\__________\/\\\_____\/\\\___\/////\\\_\/\\\/////////\\\_______\/\\\_______    
     _\/\\\____\//\\\___\/\\\___________________\/\\\_______________\////\\\_______\/\\\_____\/\\\_______\/\\\_\/\\\_______\/\\\_______\/\\\_______   
      _\/\\\_____\//\\\__\/\\\___________________\/\\\________/\\\______\//\\\______\/\\\_____\/\\\_______\/\\\_\/\\\_______\/\\\_______\/\\\_______  
       _\/\\\______\//\\\_\/\\\\\\\\\\\\\\\_______\/\\\_______\///\\\\\\\\\\\/____/\\\\\\\\\\\_\//\\\\\\\\\\\\/__\/\\\_______\/\\\_______\/\\\_______ 
        _\///________\///__\///////////////________\///__________\///////////_____\///////////___\////////////____\///________\///________\///________
Nathan Potraz
  ]],
      },

      sections = {
        { section = 'header' },
        { section = 'keys', gap = 1 },
        { icon = ' ', title = 'Recent Files', padding = { 0, 2 } },
        { section = 'recent_files', indent = 2 },
        { icon = ' ', title = 'Projects', padding = { 0, 2 } },
        { section = 'projects', indent = 2, padding = { 2, 0 } },
        { section = 'startup' },
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
          relativenumber = false,
          colorcolumn = '',
          signcolumn = 'no',
          statuscolumn = '',
        },
      },
      on_open = function()
        Snacks.indent.disable()
      end,
      on_close = function()
        Snacks.indent.enable()
      end,
    },

    bigfile = { enabled = true },
    quickfile = { enabled = true },
    explorer = { enabled = true, replace_netrw = true },
    image = {
      enabled = true,
      doc = {
        max_width = 10,
        max_height = 5,
      },
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
