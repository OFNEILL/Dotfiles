return {
	"Hoffs/omnisharp-extended-lsp.nvim",
	ft = { "cs", "csproj", "sln" },
	config = function()
		local keymap = vim.keymap

		-- replaces vim.lsp.buf.definition()
		keymap.set("n", "gd", "<cmd>lua require('omnisharp_extended').lsp_definition()<cr>")

		-- replaces vim.lsp.buf.type_definition()
		keymap.set("n", "<leader>D", "<cmd>lua require('omnisharp_extended').lsp_type_definition()<cr>")

		-- replaces vim.lsp.buf.references()
		keymap.set("n", "gr", "<cmd>lua require('omnisharp_extended').lsp_references()<cr>")

		-- replaces vim.lsp.buf.implementation()
		keymap.set("n", "gi", "<cmd>lua require('omnisharp_extended').lsp_implementation()<cr>")
	end,
}
