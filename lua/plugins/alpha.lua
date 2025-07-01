return {
  'goolord/alpha-nvim',
  -- dependencies = { 'echasnovski/mini.icons' },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local startify = require('alpha.themes.startify')

    startify.section.header.val = { '--> Low Cost Code Editor <--' }

    require('alpha').setup(startify.opts)
  end,
}
