local esc = vim.api.nvim_replace_termcodes("<ESC>", true, true, true)

vim.fn.setreg('l', 'yoconsole.log(`' .. esc .. 'pa: ${' .. esc .. 'pa}`)' .. esc .. '')
vim.fn.setreg('p', 'yoprint(f"' .. esc .. 'pa: {' .. esc .. 'pa}")' .. esc .. '')

