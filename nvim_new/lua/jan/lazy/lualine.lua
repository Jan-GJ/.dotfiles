return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local github_dark_tritanopia = require('lualine.themes.github_dark_tritanopia')
		github_dark_tritanopia.normal.c.bg = 'None'
		require('lualine').setup {
			options = {
				icons_enabled = false,
				theme = github_dark_tritanopia,
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
