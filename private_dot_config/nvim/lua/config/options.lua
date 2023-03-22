-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- local opt = vim.opt
--
-- opt.expandtab = false -- use spaces instead of tabs
-- opt.shiftwidth = 4 -- size of an indent
-- opt.tabstop = 4 -- number of spaces a tabs count for
--
vim.filetype.add({
  extension = {
    handlebars = "htmldjango",
  },
})
