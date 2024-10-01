return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "gI", builtin.lsp_implementations, {})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>ps", function()
			builtin.live_grep()
		end)
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = "Find Diagnostics" })
		vim.keymap.set("n", "<leader>pt", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

		vim.keymap.set("n", "<leader>nc", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Find neoVim files" })
	end,
}
