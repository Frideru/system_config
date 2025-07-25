return {
  -- vscode
  -- {
  --   "gamunu/vscode.nvim",
  --   priority = 100,
  --   config = function()
  --     vim.cmd([[colorscheme vscode]])
  --   end,
  -- },

  -- gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  --
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "gruvbox",
  --   },
  -- }

  -- OneDark (https://github.com/navarasu/onedark.nvim)
  -- {
  --   "navarasu/onedark.nvim",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("onedark").setup({
  --       style = "darker",
  --     })
  --     -- Enable theme
  --     require("onedark").load()
  --   end,
  -- }

  -- Gihub (https://github.com/projekt0n/github-nvim-theme)
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup()

      -- vim.cmd("colorscheme github_dark")
      -- vim.cmd("colorscheme github_dark_default")
      vim.cmd("colorscheme github_dark_dimmed")
    end,
  },
}
