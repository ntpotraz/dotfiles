require('cadra.remap')
require('cadra.base')
require('cadra.packer')

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('cadra.macos')
end
if is_win then
  require('cadra.windows')
end

print('Greetings, Cadra')
