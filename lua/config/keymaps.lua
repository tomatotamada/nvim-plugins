-- 記述ルール: vim.keymap.set("モード", "押すキー", "実行するコマンド")

-- "jk" を素早く押すと、Esc (ノーマルモードに戻る) 扱いにする
-- （これに慣れると小指が楽になります）
vim.keymap.set("i", "jk", "<Esc>")

-- 検索のハイライトを消す (Esc を押したとき)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- ファイル保存 (スペース + w)
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- Neovim終了 (スペース + q)
vim.keymap.set("n", "<leader>q", ":q<CR>")