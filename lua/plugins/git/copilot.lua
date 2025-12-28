--5.github Copilot
return {
	"github/copilot.vim",
	config = function()
		suggestion = {
			enabled = true,
			auto_trigger = true,
			debounce = 75,
			keymap = {
				accept = "<Tab>",
				accept_word = false,
				accept_line = false,
				next = "<C-]>",
				prev = "<C-[>",
				dismiss = "<C-c>",
			},
		}
		-- 必要ならここでキー設定などをしますが、最初はデフォルトでOKです
		-- デフォルトでは Tab キーで補完を受け入れます
	end,
}

