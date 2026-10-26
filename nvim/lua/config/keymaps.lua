local keymap = vim.keymap.set

-- General
keymap('i', 'jk', '<ESC>')
keymap('n', '<leader>l', '<CMD>Lazy check<CR>')
keymap('n', '<leader>rn', function() vim.lsp.buf.rename() end, { silent = true, desc = '[R]e[n]ame'})

-- Movement
keymap('n', 'n', 'nzz', { noremap = true })
keymap('n', 'N', 'Nzz', { noremap = true })
keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
keymap('n', '<C-d>', '<C-d>zz', { noremap = true })

-- Split
keymap('n', 'ss', '<CMD>split<CR>', { silent = true })
keymap('n', 'sv', '<CMD>vs<CR>', { silent = true })

-- System Copy/Paste
keymap({'v', 'x'}, '<leader>y', '"+y"', { noremap = true, silent  = true })
keymap('n', '<leader>yy', '"+yy"', { noremap = true, silent  = true })
keymap({'n', 'v', 'x'}, '<leader>p', '"+p', { noremap = true, silent  = true })

-- Buffer
keymap('n', '<Tab>', '<CMD>bnext<CR>', { silent = true })
keymap('n', '<S-Tab>', '<CMD>bprev<CR>', { silent = true })

-- Terminal
keymap('t', '<C-q>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
keymap('t', '<C-d>', '<C-\\><C-n><CMD>bd!<CR>', { desc = 'Exit terminal mode and close buffer' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
keymap('n', '<Esc>', '<CMD>nohlsearch<CR>')

-- Diagnostics
keymap('n', '<leader>f', function() vim.diagnostic.open_float() end, { silent = true, desc = '[F]loating Diagnostics'})
keymap({'n', 'i'}, '<C-h>', function() vim.lsp.buf.hover() end, {noremap = true, silent = true, desc = 'Signature Help'})

-- Plugin Keybinds ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
-- NVIM Tmux Navigator
if vim.fn.has('win32') == 1 then
  -- psmux can't decide per keypress whether to intercept C-h/j/k/l, so on
  -- Windows use Alt (psmux leaves it alone) and hand off to psmux at the edge.
  local function navigate(dir, pane_flag)
    return function()
      local win = vim.api.nvim_get_current_win()
      vim.cmd('wincmd ' .. dir)
      if vim.api.nvim_get_current_win() == win and vim.env.TMUX then
        local cmd = { 'tmux', 'select-pane', '-' .. pane_flag }
        if vim.env.TMUX_PANE then vim.list_extend(cmd, { '-t', vim.env.TMUX_PANE }, 2) end
        vim.fn.system(cmd)
      end
    end
  end
  keymap('n', '<M-h>', navigate('h', 'L'), {noremap = true, silent = true})
  keymap('n', '<M-j>', navigate('j', 'D'), {noremap = true, silent = true})
  keymap('n', '<M-k>', navigate('k', 'U'), {noremap = true, silent = true})
  keymap('n', '<M-l>', navigate('l', 'R'), {noremap = true, silent = true})
else
  keymap('n', '<C-h>', '<CMD>NvimTmuxNavigateLeft<CR>', {noremap = true, silent = true})
  keymap('n', '<C-j>', '<CMD>NvimTmuxNavigateDown<CR>', {noremap = true, silent = true})
  keymap('n', '<C-k>', '<CMD>NvimTmuxNavigateUp<CR>', {noremap = true, silent = true})
  keymap('n', '<C-l>', '<CMD>NvimTmuxNavigateRight<CR>', {noremap = true, silent = true})
end

