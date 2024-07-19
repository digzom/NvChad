---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "gruvbox",
  -- theme = require("custom.configs.different_atoms_theme"),
  theme_toggle = { "gruvbox", "one_light" },

  cmp = {
    icons = true,
    lspkind_text = false,
    style = "default",          -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "black",       -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

  hl_override = {
    CmpDoc = {
      bg = "NONE"
    },
    CmpPmenu = {
      bg = "NONE"
    },
    Comment = {
      italic = true,
    },
    NvDashAscii = {
      fg = "NONE",
      bg = "NONE",
    },

    NvDashButtons = {
      fg = "blue",
      bg = "NONE",
    },
  },
  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },
  transparency = false,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
