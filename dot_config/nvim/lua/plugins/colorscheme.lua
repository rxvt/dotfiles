return {
	-- add nord
	{ "shaunsingh/nord.nvim" },
	{ "rose-pine/neovim", name = "rose-pine" },

	-- Configure LazyVim to load nord
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "nord",
		},
	},
}
