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
keymap.set('n', '<leader>+v', '<C-w>|', opts) -- Zoom Split Vertical
keymap.set('n', '<leader>+h', '<C-w>_', opts) -- Zoom Split Horizontal
keymap.set('n', '<leader>-', '<C-w>=', opts) -- Exit Zoom Split 

-- Remap Move -------------------------------------------------------------------------------------------------------------------
keymap.set('n', '<C-j>', ':move +1<CR>') -- move line down
keymap.set('n', '<C-k>', ':move -2<CR>') -- move line up
keymap.set('n', '<leader>h', '<C-w>h', opts) -- Change Focus to left pane
keymap.set('n', '<leader>l', '<C-w>l', opts) -- change Focus to right pane
keymap.set('n', '<leader>j', '<C-w>j', opts) -- Change Focus to bottom pane
keymap.set('n', '<leader>k', '<C-w>k', opts) -- change Focus to upper pane

-- Save & Quit ------------------------------------------------------------------------------------------------------------------
keymap.set('n', '<leader>x', ':w<CR>', opts) -- Save file
keymap.set('n', '<leader>q', ':q<CR>', opts) -- Quit
keymap.set('n', '<leader>wq', ':wqa<CR>', opts) -- Save all and quit

-- Modify yank ------------------------------------------------------------------------------------------------------------------
keymap.set('n', 'p', 'pgvy', opts) -- "p" now is mapped to "pgvy" so it yanks latest pasted line 
