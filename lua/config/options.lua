-- 行番号を表示
vim.opt.number = true
vim.opt.relativenumber = false -- 相対行番号（ジャンプしやすくなる）

-- クリップボードをOSと共有 (Ctrl+C / Ctrl+V と連携)
vim.opt.clipboard = "unnamedplus"

-- インデント設定 (スペース2個分)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- タブをスペースに変換
vim.opt.autoindent = true

-- 検索設定
vim.opt.ignorecase = true -- 大文字小文字を区別しない
vim.opt.smartcase = true  -- 大文字が入っているときだけ区別する

-- マウス有効化
vim.opt.mouse = "a"

-- 色の設定（フルカラー対応）
vim.opt.termguicolors = true