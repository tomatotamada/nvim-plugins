
  --7. Nvim-tree (ファイルエクスプローラー)
  return{ 
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- ファイルアイコンを表示するために必要
  },
  config = function()
    require("nvim-tree").setup {}
    -- ショートカットキー設定 (スペース + e でNvim-treeを開く/閉じる)
    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  end,
  }

