return {
	"tamton-aquib/duck.nvim",
	config = function()
		require("duck").setup({
			character = "🦆",
			width = 2,
		})

		vim.keymap.set("n", "<leader>dd", function()
			require("duck").hatch()
		end, { desc = "Release a duck" })
		vim.keymap.set("n", "<leader>dk", function()
			require("duck").cook()
		end, { desc = "Cook a duck" })
		vim.keymap.set("n", "<leader>da", function()
			require("duck").cook_all()
		end, { desc = "Cook all ducks" })
	end,
}
