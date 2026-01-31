return {
	{
		"neovim/nvim-lspconfig", -- ★ここを Mason から Lspconfig に変更！
		event = { "BufReadPre", "BufNewFile" }, -- ファイルを開いた瞬間に起動させる
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- 1. Mason（インストーラー）を先にセットアップ
			require("mason").setup()

			-- 使用するサーバーリスト
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
