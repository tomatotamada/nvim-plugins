return {
	dir = "~/projects/nvim-Amadeus",
	name = "nvim-amadeus",
	config = function()
		require("nvim-amadeus").setup({
			fps = 25,
			width = 230,
			height = 71,
		})
	end,
}
