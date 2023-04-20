require('go').setup()

vim.g["go_addtags_transform"] = 'camelcase'

vim.keymap.set('n', '<leader>ct', ":GoCoverageToggle<CR>", bufopts)
vim.keymap.set('n', '<leader>i', ":GoImpl<CR>", bufopts)
vim.keymap.set('n', '<leader>rn', ":GoRename", bufopts)
vim.keymap.set('n', '<leader>at', ":GoAlternate<CR>", bufopts)
vim.keymap.set('n', '<leader>ts', ":vsplit<CR><C-w>l :GoAlternate<CR>", bufopts)
vim.keymap.set('n', '<leader>fs', ":GoFillStruct<CR>", bufopts)
vim.keymap.set('n', '<leader>it', ":GoAddTags<CR>", bufopts)

