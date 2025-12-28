return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "canary", -- 開発版(canary)の方が機能が新しく安定していることが多いです
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- 必須: Copilot本体
		{ "nvim-lua/plenary.nvim" }, -- 必須: ユーティリティ
	},
	build = "make tiktoken", -- 初回ビルドが必要(Linux/Mac)
	opts = {
		debug = false,
		-- ここでウィンドウの設定などが可能
		window = {
			layout = "float", -- 'vertical', 'horizontal', 'float', 'replace'
			width = 0.5, -- fractional width of parent, or absolute width in columns
			height = 0.5, -- fractional height of parent, or absolute height in rows
			-- Options specific to 'float'
			relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
			border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
			row = nil, -- row position of the window, default is centered
			col = nil, -- column position of the window, default is centered
			title = "Copilot Chat", -- title of the window
			footer = nil, -- footer of the window
			zindex = 1, -- zindex of the window
		},
	},
	keys = {
		-- キーマッピング例
		{ "<leader>cc", ":CopilotChatToggle<CR>", desc = "Toggle Copilot Chat" },
		{ "<leader>ce", ":CopilotChatExplain<CR>", desc = "Explain Code" },
		{ "<leader>cf", ":CopilotChatFix<CR>", desc = "Fix Code" },
	},
	config = function(_, opts)
		-- Copilot.luaのセットアップ（まだしていない場合）
		require("copilot").setup({})
		-- Chatのセットアップ
		require("CopilotChat").setup(opts)
	end,
}
