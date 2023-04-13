require("dapui").setup()

vim.keymap.set("n", "<leader>do", ":lua require'dapui'.open()<CR>")
vim.keymap.set("n", "<leader>dc", ":lua require'dapui'.close()<CR>")
