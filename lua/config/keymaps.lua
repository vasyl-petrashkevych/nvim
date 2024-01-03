local keymap = vim.keymap
keymap.set("n", "<Space>h", ":nohlsearch<CR>")
keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
keymap.set("n", "<C-q>", ":w<cr>")
keymap.set("i", "<C-q>", ":w<cr>")

-- Insert mode
keymap.set("i", "<C-l>", "<right>")
keymap.set("i", "<C-h>", "<left>")
keymap.set("i", "<C-j>", "<down>")

-- Tmux --
keymap.set("n", "<C-h>", "<cmd>TmuxNavigateRight<cr>")
keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
keymap.set("n", "<C-l>", "<cmd>TmuxNavigateLeft<cr>")
-- file --
keymap.set("n", "<leader>fw", ":w<cr>", { desc = "Write file" })
-- window --
keymap.set("n", "<leader>wq", "<C-w>:close<cr>", { desc = "Close window" })
keymap.set("n", "<leader>ws", "<C-w>s<cr>", { desc = "Split window horiontaly" })
keymap.set("n", "<leader>wv", "<C-w>v<cr>", { desc = "Split window " })
