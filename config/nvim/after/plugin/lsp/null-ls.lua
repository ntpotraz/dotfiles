local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,

	debug = false,
	sources = {
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"css",
				"html",
				"json",
			},
			extra_args = {
				"--single-quote",
				"--jsx-single-quote",
				"--no-semi",
			},
		}),
		formatting.black.with({
			filetypes = {
				"python",
			},
			extra_args = {
				"--fast",
			},
		}),
		formatting.stylua,
		formatting.clang_format,
	},
})
