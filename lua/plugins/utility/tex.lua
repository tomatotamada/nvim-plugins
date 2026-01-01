return {
	"lervag/vimtex",
	lazy = false, -- ファイルを開いたときに読み込むため lazy load はしない方が無難
	init = function()
		-- VimTeXの設定は init 関数内（プラグイン読み込み前）に書くことが推奨されています

		-- ビューワーの設定 (SumatraPDFを指定)
		-- 注意: 以下のパスは実際のWindows側のパスに合わせて書き換えてください (/mnt/c/... 形式)
		vim.g.vimtex_view_general_viewer = "/mnt/c/Users/death/AppData/Local/SumatraPDF/SumatraPDF.exe"

		-- SumatraPDFに渡すオプション
		vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"

		-- コンパイラの設定 (latexmkを使用)
		vim.g.vimtex_compiler_method = "latexmk"

		-- ビルドごとの自動クリーンアップ（お好みで）
		-- vim.g.vimtex_compiler_latexmk = {
		--    options = {
		--      '-shell-escape',
		--      '-verbose',
		--      '-file-line-error',
		--      '-synctex=1',
		--      '-interaction=nonstopmode',
		--    },
		-- }
	end,
}
