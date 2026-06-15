-- disable the annoying markdown lint error MD013 which gives error if markdown exceeds 80 characters length
local lint = require("lint")

-- For markdownlint-cli2 (LazyVim default)
lint.linters["markdownlint-cli2"].args = {
  "--config",
  '{"config":{"MD013":false}}',
}

-- For standard markdownlint (if used instead)
lint.linters.markdownlint.args = {
  "--disable",
  "MD013",
}

-- Keybindings
vim.keymap.set("n", "<F2>", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("i", "<F2>", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<F6>", "<cmd>split<cr>", { desc = "Horizontal split" })
vim.keymap.set("n", "<F18>", "<cmd>vsplit<cr>", { desc = "Vertical split" })
vim.keymap.set("n", "q", "<cmd>quit<cr>", { desc = "quit current pane" })

return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      on_highlights = function(hl, _)
        hl.WinSeparator = { fg = "#ff8800", bg = "NONE" }
      end,
    },
    init = function()
      vim.opt.fillchars:append({
        vert = "▏",
        horiz = "▁",
        horizup = "▏",
        horizdown = "▏",
        vertleft = "▁",
        vertright = "▁",
        verthoriz = "▁",
      })
    end,
  },
}
