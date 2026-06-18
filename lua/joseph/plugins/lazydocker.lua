return {
	"crnvl96/lazydocker.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>ld",
			function()
				require("lazydocker").open()
			end,
			desc = "LazyDocker",
		},
	},
	opts = {},
}
