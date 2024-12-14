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
      -- not needed bacause float position
      -- close_if_last_window = true,
      filesystem = {
        window = {
          position = 'float',
          popup = { -- applies to floating window only
            size = { height = '80%', width = '80%' },
            position = '50%',
          },
          mappings = {
            -- disable space (usually a selector, but <CR> is also ok)
            ['<space>'] = 'noop',
          },
        },
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
