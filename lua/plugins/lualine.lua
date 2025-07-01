return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local colors = {
          blue = '#61afef',
          green = '#98c379',
          purple = '#c678dd',
          cyan = '#56b6c2',
          red1 = '#e06c75',
          red2 = '#be5046',
          yellow = '#e5c07b',
          fg = '#abb2bf',
          bg = '#282c34',
          gray1 = '#828997',
          gray2 = '#2c323c',
          gray3 = '#3e4452',
          white = '#FFFFFF'
        }

        local onedark_theme = {
          normal = {
            a = { fg = colors.bg, bg = colors.white, gui = 'bold' },
            b = { fg = colors.bg, bg = colors.gray1 },
            c = { fg = colors.white, bg = colors.gray2 },
          },
          command = { a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' } },
          insert = { a = { fg = colors.bg, bg = colors.blue, gui = 'bold' } },
          visual = { a = { fg = colors.bg, bg = colors.purple, gui = 'bold' } },
          terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' } },
          replace = { a = { fg = colors.bg, bg = colors.red1, gui = 'bold' } },
          inactive = {
            a = { fg = colors.gray1, bg = colors.bg, gui = 'bold' },
            b = { fg = colors.gray1, bg = colors.bg },
            c = { fg = colors.gray1, bg = colors.gray2 },
          },
        }

        local mode = {
              'mode',
              fmt = function(str)
                -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
                return ' ' .. str
              end,
        }

        local filename = {
              'filename',
              file_status = true, -- displays file status (readonly status, modified status)
              path = 0,           -- 0 = just filename, 1 = relative path, 2 = absolute path
        }

         require('lualine').setup {
              options = {
                icons_enabled = true,
                theme = onedark_theme, -- Set theme based on environment variable
                -- Some useful glyphs:
                -- https://www.nerdfonts.com/cheat-sheet
                --        
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = { 'alpha', 'neo-tree', 'Avante' },
                always_divide_middle = true,
              },
              sections = {
                lualine_a = { mode },
                lualine_b = { 'branch' },
                lualine_c = { filename },
                lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
                lualine_y = { 'location' },
                lualine_z = { 'progress' },
              },
              inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = { { 'location', padding = 0 } },
                lualine_y = {},
                lualine_z = {},
              },
              tabline = {},
              extensions = { 'fugitive' },
        }
    end
}
