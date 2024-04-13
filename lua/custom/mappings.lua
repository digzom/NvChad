---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>rt"] = { "<cmd>lua vim.lsp.codelens.run() <CR>" },
    ["J"] = { "mzJ`z" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>lg"] = { "<cmd>LazyGit<CR>" },
    ["<leader>y"] = { '"+y' }, -- copy to system clipboard
    ["<leader>Y"] = { '"+Y' }, -- copy entire line to system clipboard
    ["<leader>d"] = { '"_d' }, -- delete to void
    ["<leader>P"] = { '"_dP' }, -- delete and please do not yank
    ["<leader>a"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>" }, -- change the thing in the entire file

    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["g|"] = { ":vsplit<CR>:lua vim.lsp.buf.definition()<CR>zz", "Splitted LSP definition" },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("zz", true, true, true), "n", true)
      end,
      "LSP definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>ra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<leader>lk"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["<leader>w"] = { ":w<CR>" },
    ["-"] = { ":split<CR>" },
    ["|"] = { ":vsplit<CR>" },

    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>st"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>bn"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<leader>bp"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["J"] = { ":m '>+1<CR>gv=gv" },
    ["K"] = { ":m '<-2<CR>gv=gv" },
    ["<leader>y"] = { '"+y' },
    ["<leader>d"] = { '"_d' },
  },
}

-- more keybinds!

return M
