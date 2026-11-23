-- Treesitter (nvim-treesitter `main` branch + Neovim 0.12 native vim.treesitter)
-- Note: On Windows, `tree-sitter` CLI automatically detects your installed MSVC (cl.exe).

local ts = require("nvim-treesitter")
ts.setup({})

local parsers = {
  "c_sharp",
  "lua",
  "vim",
  "vimdoc",
  "query",
  "json",
  "xml",
  "yaml",
  "markdown",
  "markdown_inline",
  "powershell",
  "bash",
}

-- Install any missing parsers asynchronously
local installed = {}
if type(ts.get_installed) == "function" then
  for _, lang in ipairs(ts.get_installed()) do
    installed[lang] = true
  end
end

local missing = vim.tbl_filter(function(lang)
  return not installed[lang]
end, parsers)

if #missing > 0 then
  ts.install(missing)
end

-- Enable native Treesitter highlighting and indentation for supported filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
  desc = "Start Treesitter highlighting and indentation",
  callback = function(args)
    local ok = pcall(vim.treesitter.start, args.buf)
    if ok then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
