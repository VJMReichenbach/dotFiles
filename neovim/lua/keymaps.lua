local set = vim.keymap.set

return {
  -- [[ Basic Keymaps ]]
  --  See `:help set()`

  -- Clear highlights on search when pressing <Esc> in normal mode
  set('n', '<Esc>', '<cmd>nohlsearch<CR>'),

  -- Open explorer (Removed for neotree)
  -- set('n', '<leader>e', vim.cmd.Ex, { desc = 'Open [E]xplorer' }),

  -- Diagnostic keymaps
  set(
    'n',
    '<leader>q',
    vim.diagnostic.setloclist,
    { desc = 'Open diagnostic [Q]uickfix list' }
  ),

  -- Exit terminal mode in the builtin terminal
  set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' }),

  -- Disable arrow keys in normal mode
  set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>'),
  set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>'),
  set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>'),
  set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>'),

  -- Keybinds to make split navigation easier.
  set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' }),
  set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' }),
  set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' }),
  set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' }),

  -- which-key show keymaps
  set(
    'n',
    '<leader>?',
    '<cmd>WhichKey<CR>',
    { desc = 'Show which-key keymaps' }
  ),

  -- Save on <leader>w
  set('n', '<leader>w', '<cmd>w<CR>', { desc = '[W]rite buffer' }),

  -- show error explanation
  set('n', '<leader>s', vim.diagnostic.open_float, { desc = '[S]how error' }),
}
