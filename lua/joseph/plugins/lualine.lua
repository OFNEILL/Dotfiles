return {
	-- Set lualine as statusline
	"nvim-lualine/lualine.nvim",
	-- See `:help lualine.txt`

	dependency = {
		"kyazdani42/nvim-web-devicons",
		"EdenEast/nightfox.nvim",
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		-- local lualineTheme = vim.cmd.colorscheme("nightfox.nvim")
		--

		lualine.setup({
			options = {
				icons_enabled = false,
				theme = "nightfox",
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_b = { require("macro_recording").show_macro_recording },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
