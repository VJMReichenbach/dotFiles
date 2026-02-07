return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    -- Mason must be loaded before its dependents so we need to set it up here.
    -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
    {
      'j-hui/fidget.nvim',
      opts = {
        progress = {
          display = {
            render_limit = 5,
          },
        },
        notification = {
          window = {
            winblend = 0,
            border = 'rounded',
          },
        },
      },
    },
  },
  config = function()
    -- Enable the following language servers
    local servers = {
      'ruff', -- Python linter
      'ty', -- Python type checker
      'rust_analyzer', -- Rust language server
      'lua_ls', -- Lua language server
      'texlab', -- LaTeX language server
      'tinymist', -- Typst lsp
    }

    for _, server in pairs(servers) do
      vim.lsp.enable(server)
    end
  end,
}
