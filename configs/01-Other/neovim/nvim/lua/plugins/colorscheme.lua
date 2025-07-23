-- return {
--   -- vscode
--   {
--     "gamunu/vscode.nvim",
--     priority = 100,
--     config = function()
--       vim.cmd([[colorscheme vscode]])
--     end,
--   },
-- }
return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
