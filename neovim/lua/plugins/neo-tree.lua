return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    -- basic options
    require('neo-tree').setup {
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    }

    -- keymaps
    vim.keymap.set(
      'n',
      '<leader>e',
      '<cmd>Neotree toggle<CR>',
      { desc = 'Neo Tree [E]xplorer' }
    )
  end,
}
