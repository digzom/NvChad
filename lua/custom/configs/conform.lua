--type conform.options
local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { { "prettier", "prettierd" } },
    typescript = { { "prettier", "prettierd" } },
    json = { { "prettier", "prettierd" } },
    css = { "prettier" },
    html = { "prettier" },
    markdown = { "mdformat" },
    python = function(bufnr)
      if require("conform").get_formatter_info("ruff_format", bufnr).available then
        return { "ruff_format" }
      else
        return { "isort", "black" }
      end
    end,
    sh = { "shfmt" },
    go = { "gofmt", "goimports" },
    elixir = { "mix format" },
    lsp_fallback = true,
    -- elixir = { "mix format" },
  },

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 1000,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)
