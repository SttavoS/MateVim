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
