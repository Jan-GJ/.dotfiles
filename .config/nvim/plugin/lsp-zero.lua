local lsp_zero = require('lsp-zero')

lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)             --Goto definition
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)                   --Peek definition
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts) --Find usage
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)  --Show full error
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)           --Move to diagnostic
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)           --Move to diagnostic
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)   --Show code actions
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)    --Show references
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)        --Rename reference
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)      --Show signature help
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'lua_ls', 'tsserver', 'rust_analyzer','clangd' },
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	}
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
	},
	formatting = {
		fields = { 'abbr', 'kind', 'menu' },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = 'λ',
				luasnip = '⋗',
				buffer = 'Ω',
				path = '🖫',
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), --Goto previous item in suggestion
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select), --Goto next item in suggestion
		['<C-y>'] = cmp.mapping.confirm({ select = true }), --Confirm suggestion
		['<C-e>'] = cmp.mapping.close(),                --Close suggestion
		['<C-Space>'] = cmp.mapping.complete(),         --Show suggestion
		['<Tab>'] = cmp.mapping.confirm({ select = true }), --Confirm suggestion
		['<CR>'] = cmp.mapping.confirm({ select = true }), --Confirm suggestion
	}),
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
})

-- Fix Undefined global 'vim'
lsp_zero.configure('lua_ls', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})
