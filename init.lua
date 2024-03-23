require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

local group = vim.api.nvim_create_augroup("reload_queries_on_query_save", { clear = true })

vim.api.nvim_create_autocmd("BufWrite", {
  pattern = "*.scm",
  callback = function()
    require("nvim-treesitter.query").invalidate_query_cache()
  end,
  group = group,
})

if vim.g.nvchad_theme == "gruvbox" then
  -- vim.api.nvim_set_hl(0, "@string.atom.elixir", { fg = "#d79921" })
  vim.api.nvim_set_hl(0, "@string.atom.elixir", { fg = "#9fd07F" })
  vim.api.nvim_set_hl(0, "@string.escape.elixir", { fg = "#689d6a" })
  vim.api.nvim_set_hl(0, "@variable.elixir", { fg = "#eae0b3" })
end

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"
