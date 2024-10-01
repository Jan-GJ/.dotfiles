return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local tokyonight = require("lualine.themes.gruvbox")
		tokyonight.normal.c.bg = "None"
		require("lualine").setup({
			options = {
				icons_enabled = false,
				theme = tokyonight,
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
