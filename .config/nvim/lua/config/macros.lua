local esc = vim.api.nvim_replace_termcodes('<ESC>', true, true, true)

vim.fn.setreg('l', "viwyoconsole.log(`<${typeof(' .. esc .. 'pa)}> ' .. esc .. 'pa: ${' .. esc .. 'pa}`);' .. esc .. '")
vim.fn.setreg('p', 'viwyoprint(f"{type(' .. esc ..'pa)} ' .. esc ..'pa: {' .. esc ..'pa}")' .. esc ..'')

