return {
	-- Neovim Greeter
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local fortune = require("alpha.fortune")
		local headers = require("ducks").headers

		math.randomseed(os.time())
		local function get_random_header()
			return headers[math.random(#headers)]
		end

		dashboard.section.header.val = get_random_header()

		dashboard.section.buttons.val = {
			dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "  Restore session", ":SessionRestore<CR>"),
			dashboard.button("m", "󰱼  Word Finder", ":Telescope live_grep<CR>"),
			dashboard.button("l", "  Marks", ":Telescope marks<CR>"),
			dashboard.button("q", "󰩈  Quit Nvim", ":qa<CR>"),
		}
		dashboard.section.footer.val = fortune()

		alpha.setup(dashboard.opts)

		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
