local set = vim.keymap.set

return {
  -- Delete inside (){}[]<>"'
  set('n', '<leader>j', 'di(', { desc = 'Delete inside (' }),
  set('n', '<leader>k', 'di{', { desc = 'Delete inside {' }),
  set('n', '<leader>l', 'di[', { desc = 'Delete inside [' }),
  set('n', '<leader>h', 'di<', { desc = 'Delete inside <' }),
  set('n', '<leader>"', 'di"', { desc = 'Delete inside "' }),
  set('n', "<leader>'", "di'", { desc = "Delete inside '" }),

  -- which-key show keymaps
  set(
    'n',
    '<leader>?',
    '<cmd>WhichKey<CR>',
    { desc = 'Show which-key keymaps' }
  ),

  -- Save on <leader>w
  set('n', '<leader>w', '<cmd>w<CR>', { desc = '[W]rite buffer' }),
}
