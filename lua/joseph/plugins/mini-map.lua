return {
	"echasnovski/mini.map",
	version = false,
	dependencies = {
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		local map = require("mini.map")

		map.setup({
			integrations = {
				map.gen_integration.builtin_search(),
				map.gen_integration.diagnostic(),
				map.gen_integration.gitsigns(),
			},

			symbols = {
				encode = map.gen_encode_symbols.dot("4x2"),
			},

			window = {
				focusable = true,
				side = "right",
				width = 18,
				winblend = 15,
				show_integration_count = true,
			},
		})

		vim.keymap.set("n", "<leader>mm", map.toggle, {
			desc = "Toggle Minimap",
		})

		vim.keymap.set("n", "<leader>mf", map.toggle_focus, {
			desc = "Focus Minimap",
		})
	end,
}
