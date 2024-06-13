return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local tokyonight = require('lualine.themes.tokyonight')
		tokyonight.normal.c.bg = 'None'
		require('lualine').setup {
			options = {
				icons_enabled = false,
				theme = tokyonight,
				component_separators = '|',
				section_separators = '',
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { 'filename' },
				lualine_x = { 'filetype', 'encoding', 'fileformat' },
				lualine_y = {},
				lualine_z = { 'location' }
			}
		}
	end
}
