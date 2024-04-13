local M = {}

local panels = {
  toxicity = {
    "    ███      ▄██████▄  ▀████    ▐████▀ ▄██   ▄    ▄████████  ▄█      ███     ▄██   ▄   ",
    "▀█████████▄ ███    ███   ███▌   ████▀  ███   ██▄ ███    ███ ███  ▀█████████▄ ███   ██▄ ",
    "   ▀███▀▀██ ███    ███    ███  ▐███    ███▄▄▄███ ███    █▀  ███▌    ▀███▀▀██ ███▄▄▄███ ",
    "    ███   ▀ ███    ███    ▀███▄███▀    ▀▀▀▀▀▀███ ███        ███▌     ███   ▀ ▀▀▀▀▀▀███ ",
    "    ███     ███    ███    ████▀██▄     ▄██   ███ ███        ███▌     ███     ▄██   ███ ",
    "    ███     ███    ███   ▐███  ▀███    ███   ███ ███    █▄  ███      ███     ███   ███ ",
    "    ███     ███    ███  ▄███     ███▄  ███   ███ ███    ███ ███      ███     ███   ███ ",
    "   ▄████▀    ▀██████▀  ████       ███▄  ▀█████▀  ████████▀  █▀      ▄████▀    ▀█████▀  ",
    "                                                                                       ",
    "                        More wood for their fires, loud neighbors                      "
  },
  psycho = {
    "██████╗ ███████╗██╗   ██╗ ██████╗██╗  ██╗ ██████╗ ",
    "██╔══██╗██╔════╝╚██╗ ██╔╝██╔════╝██║  ██║██╔═══██╗",
    "██████╔╝███████╗ ╚████╔╝ ██║     ███████║██║   ██║",
    "██╔═══╝ ╚════██║  ╚██╔╝  ██║     ██╔══██║██║   ██║",
    "██║     ███████║   ██║   ╚██████╗██║  ██║╚██████╔╝",
    "╚═╝     ╚══════╝   ╚═╝    ╚═════╝╚═╝  ╚═╝ ╚═════╝ "
  },
  aerials = {
    " ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄            ▄▄▄▄▄▄▄▄▄▄▄ ",
    "▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌          ▐░░░░░░░░░░░▌",
    "▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌ ▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░▌          ▐░█▀▀▀▀▀▀▀▀▀ ",
    "▐░▌       ▐░▌▐░▌          ▐░▌       ▐░▌     ▐░▌     ▐░▌       ▐░▌▐░▌          ▐░▌          ",
    "▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌     ▐░▌     ▐░█▄▄▄▄▄▄▄█░▌▐░▌          ▐░█▄▄▄▄▄▄▄▄▄ ",
    "▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌     ▐░▌     ▐░░░░░░░░░░░▌▐░▌          ▐░░░░░░░░░░░▌",
    "▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀█░█▀▀      ▐░▌     ▐░█▀▀▀▀▀▀▀█░▌▐░▌           ▀▀▀▀▀▀▀▀▀█░▌",
    "▐░▌       ▐░▌▐░▌          ▐░▌     ▐░▌       ▐░▌     ▐░▌       ▐░▌▐░▌                    ▐░▌",
    "▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░▌      ▐░▌  ▄▄▄▄█░█▄▄▄▄ ▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄█░▌",
    "▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌",
    " ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀ ",
  },
  atwa = {
    " ░▒▓██████▓▒░  ░▒▓████████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░  ░▒▓██████▓▒░  ",
    "░▒▓█▓▒░░▒▓█▓▒░    ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ",
    "░▒▓█▓▒░░▒▓█▓▒░    ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ",
    "░▒▓████████▓▒░    ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓████████▓▒░ ",
    "░▒▓█▓▒░░▒▓█▓▒░    ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ",
    "░▒▓█▓▒░░▒▓█▓▒░    ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ",
    "░▒▓█▓▒░░▒▓█▓▒░    ░▒▓█▓▒░      ░▒▓█████████████▓▒░  ░▒▓█▓▒░░▒▓█▓▒░ ",
  },
  boom = {
    "BBBBBBBBBBBBBBBBB                                                              !!!  ",
    "B::::::::::::::::B                                                            !!:!! ",
    "B::::::BBBBBB:::::B                                                           !:::! ",
    "BB:::::B     B:::::B                                                          !:::! ",
    "  B::::B     B:::::B   ooooooooooo      ooooooooooo      mmmmmmm    mmmmmmm   !:::! ",
    "  B::::B     B:::::B oo:::::::::::oo  oo:::::::::::oo  mm:::::::m  m:::::::mm !:::! ",
    "  B::::BBBBBB:::::B o:::::::::::::::oo:::::::::::::::om::::::::::mm::::::::::m!:::! ",
    "  B:::::::::::::BB  o:::::ooooo:::::oo:::::ooooo:::::om::::::::::::::::::::::m!:::!",
    "  B::::BBBBBB:::::B o::::o     o::::oo::::o     o::::om:::::mmm::::::mmm:::::m!:::!",
    "  B::::B     B:::::Bo::::o     o::::oo::::o     o::::om::::m   m::::m   m::::m!:::!",
    "  B::::B     B:::::Bo::::o     o::::oo::::o     o::::om::::m   m::::m   m::::m!!:!!",
    "  B::::B     B:::::Bo::::o     o::::oo::::o     o::::om::::m   m::::m   m::::m !!! ",
    "BB:::::BBBBBB::::::Bo:::::ooooo:::::oo:::::ooooo:::::om::::m   m::::m   m::::m     ",
    "B:::::::::::::::::B o:::::::::::::::oo:::::::::::::::om::::m   m::::m   m::::m !!! ",
    "B::::::::::::::::B   oo:::::::::::oo  oo:::::::::::oo m::::m   m::::m   m::::m!!:!!",
    "BBBBBBBBBBBBBBBBB      ooooooooooo      ooooooooooo   mmmmmm   mmmmmm   mmmmmm !!! "
  },
  byob = {
    " ░░▒▒▓▓████▊▊▋▋▍▍▍▎▏▏▎▏▏▎▍▍▌▌▋▋▊▊████▓▓▒▒░░ ",
    " ░                                        ░ ",
    " ▒░   ━┳━━━┓  ━┓   ┏━  ┏━━━━┓   ━┳━━━┓   ░▓ ",
    " ▓▒    ┃   ┃   ┃   ┃   ┃    ┃    ┃   ┃   ▒▓ ",
    " ▓▓    ┃   ┃   ┃   ┃   ┃    ┃    ┃   ┃   ▓▓ ",
    " █▓    ┣━━━┫   ┗━━━┫   ┃    ┃    ┣━━━┫   ▓█ ",
    " ▓▓    ┃   ┃       ┃   ┃    ┃    ┃   ┃   ▓▓ ",
    " ▓▒    ┃   ┃       ┃   ┃    ┃    ┃   ┃   ▒▓ ",
    " ▒░   ┕┻━━━┛ • ┗━━━┛ • ┗━━━━┛ • ┕┻━━━┛ • ░▒ ",
    " ░                                        ░ ",
    " ░░▒▒▓▓████▊▊▋▋▍▍▍▎▏▏▎▏▏▎▍▍▌▌▋▋▊▊████▓▓▒▒░░ ",
  }
}

local function get_panel(panels_table)
  local panel_keys = {}
  local random_number = math.random(1, 6)

  for key in pairs(panels_table) do
    table.insert(panel_keys, key)
  end

  return panels[panel_keys[random_number]]
end

M.options = {
  nvchad_branch = "v2.0",
}

M.ui = {
  ------------------------------- base46 -------------------------------------
  -- hl = highlights
  hl_add = {},
  hl_override = {},
  changed_themes = {},
  theme_toggle = { "onedark", "one_light" },
  theme = "onedark",           -- default theme
  transparency = false,
  lsp_semantic_tokens = false, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens

  -- https://github.com/NvChad/base46/tree/v2.0/lua/base46/extended_integrations
  extended_integrations = {}, -- these aren't compiled by default, ex: "alpha", "notify"

  -- cmp themeing
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "flat_light",         -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg",     -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

  telescope = { style = "borderless" }, -- borderless / bordered

  ------------------------------- nvchad_ui modules -----------------------------
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    overriden_modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
    overriden_modules = nil,
  },

  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,

    -- header = {
    --   "▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄                   ",
    --   "██████████████████████████             ▄     ",
    --   "███  ▄▄▄▄▄ █  ▄▄▄▄ ██  ███             ██▄   ",
    --   "███  ███████  ████ ██  ███▄▄▄▄▄▄▄▄▄▄▄▄▄████▄ ",
    --   "███  ██▀▀▀▀█  ████ ██  █████▌hacking▐███████▌",
    --   "███  █████ █  ████ ██▄▄███▀▀▀▀▀▀▀▀▀▀▀▀▀████▀ ",
    --   "███        █       ██  ███             ██▀   ",
    --   "██████████████████████████             ▀     ",
    --   "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀                   ",
    -- },

    header = get_panel(panels),

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

  cheatsheet = { theme = "grid" }, -- simple/grid

  lsp = {
    -- show function signatures i.e args as you type
    signature = {
      disabled = false,
      silent = true, -- silences 'no signature help available' message from appearing
    },
  },
}

M.plugins = ""                                    -- path i.e "custom.plugins", so make custom/plugins.lua file

M.lazy_nvim = require "plugins.configs.lazy_nvim" -- config for lazy.nvim startup options

M.mappings = require "core.mappings"

return M
