return { -- return を忘れずに！
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({})
  end
}
-- hlchunk.nvim (コードチャンクのハイライト)インデントガイドと組み合わせてコードの構造を視覚化するプラグイン