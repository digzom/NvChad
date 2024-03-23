local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

---@diagnostic disable-next-line: different-requires
local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "gopls", "gleam", "pyright", "marksman" }

for _, lsp in ipairs(servers) do
  if lsp == "gleam" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "gleam", "lsp" },
      filetypes = { "gleam" },
      root_dir = lspconfig.util.root_pattern("gleam.toml", ".git"),
      settings = {
        gopls = {
          completeUnimported = false,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    }
  elseif lsp == "gopls" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      settings = {
        gopls = {
          completeUnimported = false,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    }
  elseif lsp == "marksman" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "marksman", "server", "-v", "4" },
      root_dir = lspconfig.util.root_pattern(".git", ".marksman.toml"),
      filetypes = { "md", "markdown", "markdown.mdx" },
      single_file_support = true,
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end

--
-- lspconfig.pyright.setup { blabla}
