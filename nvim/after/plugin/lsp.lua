local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'sumneko_lua',
	'cssls',
	'html',
	'jsonls',
	'pyright',
})

lsp.set_preferences({
	set_lsp_keymaps = false,
})

vim.opt.signcolumn = 'yes'

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

cmp_mappings['K'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end

--vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
--vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--vim.keymap.set('n', 'gr', vim.lsp.buf.rename, opts)
end)

lsp.setup()
