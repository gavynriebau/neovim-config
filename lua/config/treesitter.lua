local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
   return
end

ts_config.setup {
	ensure_installed = "all",
	ignore_install = { "haskell" }, -- Causes error on Mac OS
	highlight = {
		enable = true,
		use_languagetree = true,
		additional_vim_regex_highlighting = false,
	},
}
