return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- 保存する直前に実行
  cmd = { "ConformInfo" },
  config = function()
    require("conform").setup({
      -- 言語ごとのフォーマッター設定
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" }, -- Pythonはこれらが定番
        javascript = { "prettier" },
        typescript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
      },
      -- 保存時に自動整形する設定
      format_on_save = {
        timeout_ms = 500, -- 0.5秒で終わらなければ諦める（フリーズ防止）
        lsp_fallback = true, -- フォーマッターがない時はLSPに頼る
      },
    })
  end,
}
