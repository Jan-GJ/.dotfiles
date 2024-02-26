require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {

    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

local builtin = require('telescope.builtin');

vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) --Project find (search for file open project)
vim.keymap.set('n', '<C-p>', builtin.git_files, {}) --Project find (search for file in open project filtered through .gitignore) [has to be in a git repository project to work]

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end) --Project search (search all files of open project)

--vim.keymap.set('n', '<leader>vh', builtin.help_tags, {}) --View help (Open help tags window)

