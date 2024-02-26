local jellybeans_transparent_bg = require('lualine.themes.jellybeans')
jellybeans_transparent_bg.normal.c.bg = 'None'

require('lualine').setup {
  options = {
	icons_enabled = false,
    theme = jellybeans_transparent_bg,
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype','encoding','fileformat'},
	lualine_y = {},
    lualine_z = {'location'}
  },
}
