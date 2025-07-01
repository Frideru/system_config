return {
  -- vscode
  {
    "gamunu/vscode.nvim",
    priority = 100,
    config = function()
      vim.cmd([[colorscheme vscode]])
    end,
  },
}
