return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local catppuccin = require('lualine.themes.catppuccin')
		catppuccin.normal.c.bg = 'None'
		require('lualine').setup {
			options = {
				icons_enabled = false,
				theme = catppuccin,
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
