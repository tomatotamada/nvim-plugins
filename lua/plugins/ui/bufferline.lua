return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- タブではなくバッファを表示
        separator_style = "slant", -- VSCodeっぽい見た目 (slant, thick, thin)
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        color_icons = true,
        
        -- マウスでクリックしたときの動作
        diagnostics = "nvim_lsp",
        
        -- 左側にオフセットを入れる（NvimTreeが開いているときに避ける設定）
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
      },
    })
  end,
  -- 便利なショートカットキーもここで設定しちゃいます
  keys = {
    -- Shift + h で左のタブへ
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    -- Shift + l で右のタブへ
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    -- スペース + b + d で現在のタブを閉じる
    { "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete Buffer" },
    -- スペース + b + p で固定（ピン留め）切り替え
    { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle Pin" },
  },
}
