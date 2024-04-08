local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "go",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "gleam",
    "python"
  },
  indent = {
    enable = true,
    disable = {
      "python"
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-s>",
      node_incremental = "<C-s>",
      scope_incremental = "<C-l>",
      node_decremental = "<C-x>",
    }
  },
  highlights = {
    enable = false
  },
  set_custom_captures = {
    ["@string.atom.elixir"] = "ThisOne"
  }
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "prettierd",
    "gopls",

    -- c/cpp stuff
    "clangd",
    "clang-format",
    --
    -- markdown
    "markdownlint",
    "marksman",
    "mdformat",

    "pyright",

    -- shell stuff
    "shfmt",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
  },
  hijack_unnamed_buffer_when_opening = false,
  filters = {
    dotfiles = false,
    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
  },
  renderer = {
    highlight_diagnostics = "all",
    highlight_opened_files = "name",
    indent_markers = {
      enable = true,
    },
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
