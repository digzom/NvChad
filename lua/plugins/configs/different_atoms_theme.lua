local M = {}

local Group = require('colorbuddy').Group
local colors = require('colorbuddy').colors

-- Define a custom highlight for Elixir atoms
Group.new('ElixirAtom', colors.red) -- Example color: red

-- Return a table with your custom highlights
M.hl_add = {
 atom = { fg = colors.red },
}

return M

