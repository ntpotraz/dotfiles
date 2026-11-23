-- Plugin declarations and loading via Neovim 0.12 native vim.pack

local gh = function(repo)
  return 'https://github.com/' .. repo
end

-- Build / update hooks MUST be registered before the first vim.pack.add() call.
vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('UserPackHooks', { clear = true }),
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind

    if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then
        vim.cmd.packadd('nvim-treesitter')
      end
      vim.cmd('TSUpdate')
    end
  end,
})

vim.pack.add({
  -- Shared dependencies
  gh('nvim-lua/plenary.nvim'),
  gh('folke/lazydev.nvim'),

  -- UI
  gh('folke/tokyonight.nvim'),
  gh('nvim-lualine/lualine.nvim'),
  gh('sphamba/smear-cursor.nvim'),
  gh('folke/noice.nvim'),
  gh('MunifTanjim/nui.nvim'),

  -- Picker & QoL utilities
  gh('folke/snacks.nvim'),
  gh('nvim-mini/mini.nvim'),
  gh('stevearc/oil.nvim'),

  -- Treesitter (Neovim 0.12 main branch rewrite)
  { src = gh('nvim-treesitter/nvim-treesitter'), version = 'main' },

  -- Completion (semver range downloads prebuilt fuzzy binary on Windows)
  gh('rafamadriz/friendly-snippets'),
  { src = gh('saghen/blink.cmp'), version = vim.version.range('1.*') },

  -- LSP & Package Management
  gh('mason-org/mason.nvim'),
  gh('neovim/nvim-lspconfig'),
  gh('WhoIsSethDaniel/mason-tool-installer.nvim'),

  -- C# / .NET
  gh('seblyng/roslyn.nvim'),
  gh('GustavEikaas/easy-dotnet.nvim'),

  -- Misc
  gh('folke/persistence.nvim'),
}, { confirm = false })

-- Configure plugins in dependency order:
-- 1. UI & picker first so notifications and colorscheme are ready
require('plugins.ui')
require('plugins.snacks')
require('plugins.oil')
require('plugins.mini')
require('plugins.oneliners')

-- 2. Syntax & completion
require('plugins.treesitter')
require('plugins.completion')

-- 3. Mason + global LSP (must run before dotnet so Mason's bin dir is on PATH)
require('plugins.lsp')

-- 4. C# / .NET tooling (Roslyn LSP + easy-dotnet)
require('plugins.dotnet')
