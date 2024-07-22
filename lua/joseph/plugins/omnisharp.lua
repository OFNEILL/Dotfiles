return {
	"Hoffs/omnisharp-extended-lsp.nvim",
	ft = { "cs", "csproj", "sln" },
	config = function()
		local keymap = vim.keymap

		-- replaces vim.lsp.buf.definition()
		keymap.set("n", "gd", "<cmd>lua require('omnisharp_extended').lsp_definition()<cr>")

		-- replaces vim.lsp.buf.type_definition()
		keymap.set("n", "<leader>c", "<cmd>lua require('omnisharp_extended').lsp_type_definition()<cr>")

		-- replaces vim.lsp.buf.references()
		keymap.set("n", "gr", "<cmd>lua require('omnisharp_extended').lsp_references()<cr>")

		-- replaces vim.lsp.buf.implementation()
		keymap.set("n", "gi", "<cmd>lua require('omnisharp_extended').lsp_implementation()<cr>")
	end,
}
-- local util = require("util")
--
-- return {
--
-- 	-- Add C# to treesitter
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		opts = function(_, opts)
-- 			if type(opts.ensure_installed) == "table" then
-- 				util.list_insert_unique(opts.ensure_installed, "c_sharp")
-- 			end
-- 		end,
-- 	},
--
-- 	-- Correctly setup lspconfig for C# 🚀
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		opts = {
-- 			servers = {
-- 				-- Ensure mason installs the server
-- 				omnisharp = {},
-- 			},
-- 			-- configure omnisharp to fix the semantic tokens bug (really annoying)
-- 			setup = {
-- 				omnisharp = function(_, _)
-- 					require("lazyvim.util").on_attach(function(client, _)
-- 						if client.name == "omnisharp" then
-- 							---@type string[]
-- 							local tokenModifiers =
-- 								client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
-- 							for i, v in ipairs(tokenModifiers) do
-- 								tokenModifiers[i] = v:gsub(" ", "_")
-- 							end
-- 							---@type string[]
-- 							local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
-- 							for i, v in ipairs(tokenTypes) do
-- 								tokenTypes[i] = v:gsub(" ", "_")
-- 							end
-- 						end
-- 					end)
-- 					return false
-- 				end,
-- 			},
-- 		},
-- 	},
-- }
