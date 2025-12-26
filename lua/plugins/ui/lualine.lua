  --8. Lualine (ステータスライン)
  return{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
	options = {
	  theme = 'tokyonight', -- TokyoNightテーマに合わせる
	}
      }
    end
  }

  