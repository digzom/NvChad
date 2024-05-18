local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

---@diagnostic disable-next-line: different-requires
local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tsserver",
  "gopls",
  "gleam",
  "pyright",
  "marksman",
  "tailwindcss-language-server",
}

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
  elseif lsp == "tailwindcss-language-server" then
    lspconfig[lsp].setup {
      lspconfig.tailwindcss.setup {
        root_dir = lspconfig.util.root_pattern(
          "assets/tailwind.config.js",
          "tailwind.config.js",
          "tailwind.config.ts",
          "postcss.config.js",
          "postcss.config.ts",
          "package.json",
          "node_modules"
        ),
        init_options = {
          userLanguages = {
            elixir = "phoenix-heex",
            eruby = "erb",
            heex = "phoenix-heex",
            svelte = "html",
          },
        },
        handlers = {
          ["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
            vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", { _id = params._id })
          end,
        },
        settings = {
          includeLanguages = {
            typescript = "javascript",
            typescriptreact = "javascript",
            ["html-eex"] = "html",
            ["phoenix-heex"] = "html",
            heex = "html",
            eelixir = "html",
            elm = "html",
            erb = "html",
            svelte = "html",
          },
          tailwindCSS = {
            lint = {
              cssConflict = "warning",
              invalidApply = "error",
              invalidConfigPath = "error",
              invalidScreen = "error",
              invalidTailwindDirective = "error",
              invalidVariant = "error",
              recommendedVariantOrder = "warning",
            },
            experimental = {
              classRegex = {
                [[class= "([^"]*)]],
                [[class: "([^"]*)]],
                '~H""".*class="([^"]*)".*"""',
              },
            },
            validate = true,
          },
        },
        filetypes = {
          "css",
          "scss",
          "sass",
          "html",
          "heex",
          "elixir",
          "eruby",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "svelte",
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
