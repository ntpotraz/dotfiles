require("lspsaga").setup({
	ui = {
		-- currently only round theme
		theme = "round",
		-- this option only work in neovim 0.9
		title = true,
		-- border type can be single,double,rounded,solid,shadow.
		border = "single",
		winblend = 0,
		expand = "",
		collapse = "",
		preview = " ",
		code_action = "💡",
		diagnostic = "🐞",
		incoming = " ",
		outgoing = " ",
		colors = {
			--float window normal background color
			normal_bg = "#25272e",
			--title background color
			title_bg = "#afd700",
			red = "#e95678",
			magenta = "#b33076",
			orange = "#FF8700",
			yellow = "#f7bb3b",
			green = "#afd700",
			cyan = "#36d0e0",
			blue = "#61afef",
			purple = "#CBA6F7",
			white = "#d1d4cf",
			black = "#1c1c19",
		},
		kind = {},
	},
	lightbulb = {
		enable = false,
		enable_in_insert = false,
		sign = false,
		sign_priority = 40,
		virtual_text = false,
	},
})

local keymap = vim.keymap.set
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gd", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Peek Definition
-- you can edit the definition file in this float window
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- Show line diagnostics you can pass argument ++unfocus to make
-- show_line_diagnostics float window unfocus
keymap("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Diagnostic jump can use `<c-o>` to jump back
keymap("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>")
keymap("n", "<C-k>", "<cmd>Lspsaga diagnostic_jump_prev<CR>")

-- Toggle Outline
keymap("n", "go", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- if there has no hover will have a notify no information available
-- to disable it just Lspsaga hover_doc ++quiet
-- press twice it will jump into hover window
keymap("n", "gh", "<cmd>Lspsaga hover_doc<CR>")
