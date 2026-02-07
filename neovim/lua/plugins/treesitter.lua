return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.config', -- Sets main module to use for opts
  dependencies = {},
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = {
      'bash',
      'diff',
      'lua',
      'markdown',
      'markdown_inline',
      'nu',
      'python',
      'rust',
      'vim',
      'vimdoc',
    },
    ignore_install = { 'latex' },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
    },
  },
}
