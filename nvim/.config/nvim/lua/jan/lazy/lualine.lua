return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local myTheme = require("lualine.themes.ayu")
		myTheme.normal.c.bg = "None"
		require("lualine").setup({
			options = {
				icons_enabled = false,
				theme = myTheme,
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "filetype", "encoding", "fileformat" },
				lualine_y = {},
				lualine_z = { "location" },
			},
		})
	end,
}
