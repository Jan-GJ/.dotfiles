--Leader
vim.g.mapleader = " "

--Project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--Move selected code up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Format current file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

--Rename variable in whole file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--Source current file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

--Compile and run current .c file
vim.keymap.set("n", "<leader>rc", function()	
	vim.cmd([[!gcc % -o %< && echo -e "\n" && %<]])
end)

--Remap Copilot tab accept to control tab
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

