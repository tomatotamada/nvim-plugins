return {
	"keaising/im-select.nvim",
	config = function()
		require("im_select").setup({
			-- 【変更点1】コマンドを zenhan.exe に変更
			-- パスは実際に zenhan.exe を置いた場所に書き換えてください
			-- System32に置いた場合は /mnt/c/Windows/System32/zenhan.exe
			default_command = "/mnt/c/Windows/System32/zenhan.exe",

			-- 【変更点2】OFFにするためのコードを "0" に変更
			default_im_select = "0",

			-- 挿入モード開始時の復元を無効化
			set_previous_events = {},
		})
	end,
}
