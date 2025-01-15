local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Files
keymap.set("n", "<C-a>", "gg<S-v>G", _, { desc = "Select All" })
keymap.set("n", "<leader>w", ":update<Return>", opts, { desc = "Save file" })
keymap.set("n", "<leader>q", ":quit<Return>", opts, { desc = "Quit file" })
keymap.set("n", "<leader>Q", ":qa<Return>", opts, { desc = "Quit NeoVim" })

-- Navigate vim panes better
keymap.set("n", "<C-k>", ":wincmd k<CR>")
keymap.set("n", "<C-j>", ":wincmd j<CR>")
keymap.set("n", "<C-h>", ":wincmd h<CR>")
keymap.set("n", "<C-l>", ":wincmd l<CR>")
