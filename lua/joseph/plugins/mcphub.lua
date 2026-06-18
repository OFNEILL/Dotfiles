return {
	"ravitemer/mcphub.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	build = "bundled_build.lua",
	cmd = {
		"MCPHub",
	},
	keys = {
		{
			"<leader>mcp",
			"<cmd>MCPHub<cr>",
			desc = "Open MCP Hub",
		},
	},
	opts = {
		use_bundled_binary = true,
		config = vim.fn.expand("~/.config/mcphub/servers.json"),
		port = 37373,
	},
}
