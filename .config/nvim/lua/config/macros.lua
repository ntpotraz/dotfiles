local esc = vim.api.nvim_replace_termcodes("<ESC>", true, true, true)

vim.fn.setreg('l', 'yoconsole.log(`' .. esc ..'pa: ${' .. esc ..'p')
vim.fn.setreg('p', 'yoprint(f"' .. esc .. 'pa: {' .. esc .. 'p')
