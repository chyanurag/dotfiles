return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "javascript", "typescript", "lua", "cpp", "c", "rust" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
