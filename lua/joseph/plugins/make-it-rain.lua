return {
	"eandrju/cellular-automaton.nvim",

	config = function()
		local make_it_rain = require("cellular-automaton")
		local keymap = vim.keymap

		keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
	end,
}
