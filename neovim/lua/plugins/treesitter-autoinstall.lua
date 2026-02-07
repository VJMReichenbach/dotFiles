return {
  'mks-h/treesitter-autoinstall.nvim',
  config = function()
    require('treesitter-autoinstall').setup {
      ignore = { 'latex' },
      highlight = true,
      regex = {},
    }
  end,
}
