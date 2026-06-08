local keymap = vim.keymap

-- Files
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select All" })
keymap.set("n", "<C-s>", ":update<Return>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":quit<Return>", { desc = "Quit file" })
keymap.set("n", "<leader>Q", ":qa<Return>", { desc = "Quit NeoVim" })

-- Navigate vim panes better
keymap.set("n", "<C-k>", ":wincmd k<CR>")
keymap.set("n", "<C-j>", ":wincmd j<CR>")
keymap.set("n", "<C-h>", ":wincmd h<CR>")
keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- UI Toggles
keymap.set("n", "<leader>uw", function()
  vim.opt.wrap = not vim.opt.wrap:get()
  vim.notify("Wrap " .. (vim.opt.wrap:get() and "enabled" or "disabled"))
end, { desc = "Toggle Wrap" })

keymap.set("n", "<leader>us", function()
  vim.opt.spell = not vim.opt.spell:get()
  vim.notify("Spell " .. (vim.opt.spell:get() and "enabled" or "disabled"))
end, { desc = "Toggle Spell" })

keymap.set("n", "<leader>ud", function()
  local enabled = vim.diagnostic.is_enabled and vim.diagnostic.is_enabled() or true
  vim.diagnostic.enable(not enabled)
  vim.notify("Diagnostics " .. (not enabled and "enabled" or "disabled"))
end, { desc = "Toggle Diagnostics" })

keymap.set("n", "<leader>ul", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
  vim.notify("Relative number " .. (vim.opt.relativenumber:get() and "enabled" or "disabled"))
end, { desc = "Toggle Relative Number" })
