-- Snacks.nvim (picker, explorer, input, notifier)
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})

require("snacks").setup({
  bigfile = { enabled = true },
  quickfile = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
  explorer = { enabled = true },
  picker = {
    enabled = true,
    ui_select = true, -- Replaces vim.ui.select (used by LSP code actions, easy-dotnet, etc.)
    win = {
      input = {
        keys = {
          ['<ESC>'] = { 'close', mode = { 'n', 'i' } },
        },
      },
    },
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
  },
  dashboard = {
    enabled = true,
    preset = {
      keys = {
        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = "󰦛 ", key = "s", desc = "Last Session", action = function() require('persistence').load({ last = true }) end},
        { icon = "󰒲 ", key = "u", desc = "Update Plugins", action = ":lua vim.pack.update()" },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
      header = [[
      ██╗  ██╗███████╗██╗   ██╗███████╗██╗ ██████╗ ██╗  ██╗████████╗
      ██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔════╝██║██╔════╝ ██║  ██║╚══██╔══╝
      █████╔╝ █████╗   ╚████╔╝ ███████╗██║██║  ███╗███████║   ██║   
      ██╔═██╗ ██╔══╝    ╚██╔╝  ╚════██║██║██║   ██║██╔══██║   ██║   
      ██║  ██╗███████╗   ██║   ███████║██║╚██████╔╝██║  ██║   ██║   
      ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
      ]],
    },
    sections = {
      { section = "header" },
      { section = "keys", gap = 1 },
      { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 2, 2 } },
      { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
    },
  },

  styles = {
    zen = {
      minimal = true,
      width = 0.9,
      backdrop = { transparent = true, blend = 20 },
      wo = {
        statuscolumn = '    ',
      },
    },
  },
})
