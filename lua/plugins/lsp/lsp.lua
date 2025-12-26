--lsp
return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- 1. Mason（インストーラー）のセットアップ
      require("mason").setup()

      -- ★ここが最重要ポイント！
      -- サーバーのリストをここで「変数」として作ります。
      -- これがあるから、下のループでエラーになりません。
      local servers = {
        "lua_ls",
        "pyright",
        "ts_ls",
        "html",
        "cssls",
        "bashls",
      }

      -- 2. Mason-LSPConfig のセットアップ
      require("mason-lspconfig").setup({
        -- ここでさっき作った変数(servers)を使います
        ensure_installed = servers,
        automatic_installation = true,
      })

      -- 3. 各サーバーの起動設定（手動ループ方式）
      -- setup_handlers はバグの原因になるので使いません。
      -- 代わりに、標準的な「for文」で回します。これなら確実に動きます。
      
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      for _, server in ipairs(servers) do
        -- もしサーバー設定が存在すればセットアップを実行
        if lspconfig[server] then
          lspconfig[server].setup({
            capabilities = capabilities,
          })
        end
      end
    end,
  }
}
