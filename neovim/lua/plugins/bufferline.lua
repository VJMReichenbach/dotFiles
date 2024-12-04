return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup()

    vim.keymap.set(
      'n',
      '<leader>bb',
      '<cmd>BufferLinePick<CR>',
      { desc = '[B]uffer Pick' }
    )
    vim.keymap.set(
      'n',
      '<leader>bc',
      '<cmd>BufferLinePickClose<CR>',
      { desc = '[B]uffer Pick [C]lose' }
    )

    vim.keymap.set(
      'n',
      '<leader>bn',
      '<cmd>BufferLineCycleNext<CR>',
      { desc = '[B]uffer [N]ext' }
    )
    vim.keymap.set(
      'n',
      '<leader>bp',
      '<cmd>BufferLineCyclePrev<CR>',
      { desc = '[B]uffer [P]revious' }
    )
    vim.keymap.set(
      'n',
      '<leader>bt',
      '<cmd>BufferLineTabRename<CR>',
      { desc = '[B]uffer [T]ab Rename' }
    )
    vim.keymap.set(
      'n',
      '<leader>bi',
      '<cmd>BufferLineTogglePin<CR>',
      { desc = '[B]uffer Toggle P[I]n' }
    )

    vim.keymap.set(
      'n',
      '<leader>bd',
      '<cmd>BufferLineSortByDirectory<CR>',
      { desc = '[B]uffer Sort [D]irectory' }
    )
    vim.keymap.set(
      'n',
      '<leader>be',
      '<cmd>BufferLineSortByExtension<CR>',
      { desc = '[B]uffer Sort [E]xtension' }
    )
  end,
}
