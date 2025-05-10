vim.keymap.set('n', '<C-n>', ':tabnext<CR>') -- Next Tab
vim.keymap.set('n', '<C-m>', ':tabprevious<CR>') -- Previous Tab
vim.keymap.set('n', 'p', 'pgvy', { noremap = true, silent = true}) -- "p" now is mapped to "pgvy" so it yanks latest pasted line 
