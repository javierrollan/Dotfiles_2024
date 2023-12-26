return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    },
    config = function()
        vim.keymap.set('n', '<C-t>', ':Neotree show toggle reveal <CR>', {}) -- Neotree Toggle
        vim.keymap.set('n', '<C-f>', ':Neotree focus<CR>', {}) -- Neotree focus
        vim.keymap.set('n', '<C-g>', ':Neotree git_status bottom toggle<CR>', {}) -- Neotree git
    end
}
