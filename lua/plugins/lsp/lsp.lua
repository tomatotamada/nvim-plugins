return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- 1. Mason（インストーラー）を先にセットアップ
			require("mason").setup()

			-- 使用するサーバーリスト（rust_analyzerはMason管理外にする）
			local servers = {
				"lua_ls",
				"pyright",
				"ts_ls",
				"html",
				"cssls",
				"bashls",
				"texlab",
				"yamlls",
				"taplo",
				"astro",
				"tailwindcss",
			}

			-- 共通の capabilities
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- rust_analyzer はnvim組み込みAPI(vim.lsp.config)で設定（Mason版はnightly/edition2024非対応のため）
			vim.lsp.config("rust_analyzer", {
				cmd = { "rustup", "run", "nightly", "rust-analyzer" },
				root_markers = { "Cargo.toml", "rust-project.json" },
				capabilities = capabilities,
				filetypes = { "rust" },
			})
			vim.lsp.enable("rust_analyzer")

			-- 2. Mason-LSPConfig で一括設定（handlers使用）
			require("mason-lspconfig").setup({
				ensure_installed = servers,
				automatic_installation = true,

				handlers = {
					-- (A) 普通のサーバー用の設定
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,

					-- rust_analyzer はMason版を使わない（上でvim.lsp.configで設定済み）
					["rust_analyzer"] = function() end,

					-- (B) TexLab (LaTeX) 専用の設定
					["texlab"] = function()
						require("lspconfig").texlab.setup({
							capabilities = capabilities,
							single_file_support = true,
							settings = {
								texlab = {
									build = {
										onSave = false,
										forwardSearchAfter = false,
									},
									chktex = {
										onOpenAndSave = true,
										onEdit = false,
									},
									formatterLineLength = 80,
								},
							},
						})
					end,
				},
			})
		end,
	},
}
