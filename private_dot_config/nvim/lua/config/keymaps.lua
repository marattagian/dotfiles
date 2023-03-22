-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map({ "i", "v", "n", "s" }, "<A-s>", "<cmd>w<cr>", { desc = "Save file" })
map({ "i", "v", "n", "s" }, "<A-w>", "<cmd>SudaWrite<cr>", { desc = "Save file as root" })

map("n", "<leader>o", "<cmd>Neotree float<cr>", { desc = "Float Neotre" })

vim.keymap.set("n", "<A-x>", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })
