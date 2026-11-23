-- Mason & Neovim 0.12 native LSP configuration

-- Mason manages external LSP servers & tools (adds Mason bin dir to PATH)
require("mason").setup({
  registries = {
    "github:mason-org/mason-registry",
    "github:Crashdummyy/mason-registry", -- Provides the Roslyn LSP package
  },
  ui = {
    border = "rounded",
  },
})

require('mason-tool-installer').setup ({
  ensure_installed = {
    'roslyn',
    'lua-language-server',
  }
})

require('lazydev').setup({
  ft = 'lua',
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    { path = 'snacks.nvim', words = { 'Snacks' } },
  },
})

-- Diagnostic display settings
vim.diagnostic.config({
  severity_sort = true,
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
  },
  float = {
    border = "rounded",
    source = "if_many",
  },
})

-- Advertise blink.cmp capabilities to all native LSP servers
vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

-- Enable inlay hints automatically when an attached LSP server supports them
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, args.buf) then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

-- Optional: Enable lua_ls automatically if installed via :MasonInstall lua-language-server
if vim.fn.executable("lua-language-server") == 1 then
  vim.lsp.config("lua_ls", {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        workspace = {
          checkThirdParty = false,
          library = { vim.env.VIMRUNTIME },
        },
      },
    },
  })
  vim.lsp.enable("lua_ls")
end
