local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- Key Remaps -------------------------------------------------------------------------------------------------------------------
keymap.set('n', '<C-n>', ':tabnext<CR>') -- Next Tab
keymap.set('n', '<C-m>', ':tabprevious<CR>') -- Previous Tab
keymap.set('n', '<leader>t', ':Neotree toggle<CR>')
keymap.set('n', '<leader>f', ':Neotree action=focus<CR>')

-- Indent -----------------------------------------------------------------------------------------------------------------------
keymap.set('n', '<', '<gv')
keymap.set('n', '>', '>gv')

-- Split Windows -----------------------------------------------------------------------------------------------------------------
keymap.set('n', '<leader>sv', ':vsplit<CR>', opts) -- Split Vertical
keymap.set('n', '<leader>sh', ':split<CR>', opts) -- Split Horizontal

-- Remap Move -------------------------------------------------------------------------------------------------------------------
keymap.set('n', '<C-j>', ':move +1<CR>') -- move line down
keymap.set('n', '<C-k>', ':move -2<CR>') -- move line up
keymap.set('n', '<leader>h', '<C-w>h', opts) -- Change Focus to left pane
keymap.set('n', '<leader>l', '<C-w>l', opts) -- change Focus to right pane
keymap.set('n', '<C-w>', ':w<CR>', opts) -- move line up
keymap.set('n', '<leader>q', ':wq<CR>', opts) -- move line up
-- keymap.set('n', '<leader>qq', ':wqa<CR>', opts) -- move line up

-- Modify yank ------------------------------------------------------------------------------------------------------------------
keymap.set('n', 'p', 'pgvy', opts) -- "p" now is mapped to "pgvy" so it yanks latest pasted line 
