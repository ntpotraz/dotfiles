require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- ===========================LSP Server Setups===============================
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "pyright",
        "tsserver",
        "clangd",
        "jdtls",
        "html",
        "cssls",
    },
    handlers = {
        require('lsp-zero').default_setup,
    },
})

local lsp = require('lspconfig')
local lsp_zero = require('lsp-zero')

lsp.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

lsp_zero.setup_servers({
    'jdtls',
    'pyright',
    'clangd',
    'html',
    'cssls',
    'rust_analyzer',
    'tsserver',
})


-- ===========================================================================

-- ============================Linter Setup===================================

local conform = require('conform')

conform.setup({
    formatters_by_ft = {
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        json = { 'prettierd' },
        html = { 'prettierd' },
        css = { 'prettierd' },
        lau = { 'stylua' },
        python = { 'isort', 'black' }
    },
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    }
})
vim.keymap.set({ 'n', 'v' }, "<leader>mp", function()
    conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    })
end, { desc = "Format file or range (in visual mode)" })

-- ===========================================================================

-- ==========================Formatter Setup==================================

local lint = require('lint');

lint.linters_by_ft = {
    javascript = { 'eslint_d' },
    typescript = { 'eslint_d' },
    javascriptreact = { 'eslint_d' },
    typescriptreact = { 'eslint_d' },
    html = { 'eslint_d' },
    css = { 'eslint_d' },
    python = { 'pylint' },
}

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    callback = function()
        lint.try_lint()
    end,
})

vim.keymap.set('n', '<leader>l', function()
    lint.try_lint()
end, { desc = "Trigger linting for current file" })

-- ===========================================================================
