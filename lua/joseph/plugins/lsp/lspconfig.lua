return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},

	{
		"nvim-java/nvim-java",
		ft = "java",
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },

		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			"nvim-java/nvim-java",
		},

		opts = function(_, opts)
			local builtin = require("telescope.builtin")

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
				callback = function(ev)
					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, {
							buffer = ev.buf,
							silent = true,
							desc = desc,
						})
					end

					map("n", "gR", builtin.lsp_references, "[G]oto [R]eferences")
					map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
					map("n", "gd", builtin.lsp_definitions, "[G]oto LSP [D]efinition")
					map("n", "gi", builtin.lsp_implementations, "[G]oto [I]mplementation")
					map("n", "gt", builtin.lsp_type_definitions, "Type [D]efinition")

					map("n", "<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
					map("n", "<leader>dw", builtin.lsp_dynamic_workspace_symbols, "[D]ynamic [W]orkspace Symbols")

					map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")

					map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Buffer Diagnostics")
					map("n", "<leader>d", vim.diagnostic.open_float, "Line Diagnostics")
					map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
					map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")

					map("n", "K", vim.lsp.buf.hover, "Hover Documentation")

					map("n", "<leader>rs", "<cmd>LspRestart<CR>", "Restart LSP")
				end,
			})

			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = "󰠠 ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
			})

			opts.capabilities = require("cmp_nvim_lsp").default_capabilities(opts.capabilities)

			opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},

				svelte = {},

				graphql = {
					filetypes = {
						"graphql",
						"gql",
						"svelte",
						"typescriptreact",
						"javascriptreact",
					},
				},

				omnisharp = {
					filetypes = {
						"cs",
						"csproj",
					},
				},

				emmet_ls = {
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				},

				jdtls = {
					settings = {
						java = {
							signatureHelp = {
								enabled = true,
							},
							import = {
								enabled = true,
							},
							rename = {
								enabled = true,
							},
						},
					},
				},
			})

			opts.setup = opts.setup or {}

			opts.setup.svelte = function(_, server_opts)
				server_opts.on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePost", {
						buffer = bufnr,
						pattern = { "*.js", "*.ts" },
						callback = function(ctx)
							client.notify("$/onDidChangeTsOrJsFile", {
								uri = vim.uri_from_fname(ctx.file),
							})
						end,
					})
				end
			end

			opts.setup.jdtls = function()
				require("java").setup()
			end
		end,
	},
}
