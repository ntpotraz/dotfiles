local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
	"cssls",
	"html",
	"jsonls",
	"pyright",
	"clangd",
})

lsp.set_preferences({
	set_lsp_keymaps = false,
})

vim.opt.signcolumn = "no"

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["K"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.configure("tsserver", {
	on_attach = function(client, bufnr)
		client.server_capabilities.document_formatting = false
	end,
	settings = {
		completions = {
			completeFunctionCalls = true,
		},
	},
})

-- Null_ls config stuff

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

local sources = {
	formatting.eslint_d,
	formatting.autopep8,
	formatting.stylua,
	formatting.prettierd,
	formatting.clang_format,
}

null_ls.setup({
	sources = {
		--- do whatever you need to do
		sources = sources,
		debug = false,
	},

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})

lsp.setup()
