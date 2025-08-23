-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local command = vim.api.nvim_create_user_command

-- better indenting
map("v", "<S-Tab>", "<gv")
map("v", "<Tab>", ">gv")
map("n", "<Space>", "i", { noremap = true, silent = true })
map("n", "<C-z>", "u", { noremap = true })
map("i", "<C-z>", "<ESC>u<CR>i", { noremap = true })

command("Q", function(opts)
  if opts.bang then
    vim.cmd("qa!")
  else
    vim.cmd("qa")
  end
end, { bang = true })
