-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.g.autoformat = false

vim.api.nvim_create_autocmd("FileType", {
	pattern = "csv",
	desc = "Enable CSV View on .csv files",
	callback = function()
		require("csvview").enable()
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "TSUpdate",
	callback = function()
		require("nvim-treesitter.parsers").asciidoc = {
			install_info = {
				url = "https://github.com/cathaysia/tree-sitter-asciidoc",
				revision = "8b7488e4a92133c9adacc49e97652007e1b6621a", -- commit hash for revision to check out; HEAD if missing
				-- optional entries:
				-- branch = 'develop', -- only needed if different from default branch
				location = "tree-sitter-asciidoc", -- only needed if the parser is in subdirectory of a "monorepo"
				-- generate = true, -- only needed if repo does not contain pre-generated `src/parser.c`
				-- generate_from_json = false, -- only needed if repo does not contain `src/grammar.json` either
				-- queries = 'queries/neovim', -- also install queries from given directory
			},
		}
	end,
})
