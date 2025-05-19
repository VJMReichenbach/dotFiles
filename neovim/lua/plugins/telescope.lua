return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      build = 'make',

      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        wrap_results = true,
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- enable wrapping in preview window
    vim.api.nvim_create_autocmd('User', {
      pattern = 'TelescopePreviewerLoaded',
      callback = function(args)
        vim.wo.wrap = true
        vim.wo.number = true
      end,
    })

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set(
      'n',
      '<leader>ff',
      builtin.find_files,
      { desc = '[F]ind [F]iles' }
    )
    vim.keymap.set(
      'n',
      '<leader>fa',
      builtin.live_grep,
      { desc = '[F]ind across [A]ll files' }
    )
    vim.keymap.set(
      'n',
      '<leader>fh',
      builtin.help_tags,
      { desc = '[F]ind in [H]elp' }
    )

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>fc', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(
        require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        }
      )
    end, { desc = '[F]uzzily search in [C]urrent buffer' })
  end,
}
