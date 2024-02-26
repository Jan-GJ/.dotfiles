require('nvim-treesitter.configs').setup {
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "html", "rust", "go", "javascript", "typescript" },
	autotag = {
		enable = true,
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
}
