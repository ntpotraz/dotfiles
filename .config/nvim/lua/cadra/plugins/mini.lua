return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup {
        mappings = {
          add = "'sa",            -- Add surrounding in Normal and Visual modes
          delete = "'sd",         -- Delete surrounding
          find = "'sf",           -- Find surrounding (to the right)
          find_left = "'sF",      -- Find surrounding (to the left)
          highlight = "'sh",      -- Highlight surrounding
          replace = "'sr",        -- Replace surrounding
          update_n_lines = "'sn", -- Update `n_lines`
          suffix_last = "'sl",    -- Suffix to search with "prev" method
          suffix_next = "'sn",    -- Suffix to search with "next" method
        },
      }

      require('mini.icons').setup {}

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
