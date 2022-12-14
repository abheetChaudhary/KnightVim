local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	-- -- Global offset_encoding for null-ls
	-- on_init = function(new_client, _)
	-- new_client.offset_encoding = "utf-8"
	-- end,

	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast", "--line-length=80" }, filetype = { "python" } }),
		-- formatting.yapf,
		formatting.stylua,
		diagnostics.flake8.with({ extra_args = { "--extend-ignore=F821,E302,E501" }, filetype = { "python" } }),
		formatting.clang_format,
		formatting.rustfmt.with({ extra_args = { "--edition=2021" }, filetype = { "rust" }, arg = { "--wmit=stdout" } }),
	},
})
