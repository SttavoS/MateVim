return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"lua",
					"javascript",
					"typescript",
					"tsx",
					"html",
					"css",
					"scss",
					"vue",
					"rust",
					"elixir",
					"heex",
					"eex",
					"python",
					"c_sharp",
					"fsharp",
					"php",
					"sql",
					"json",
					"yaml",
					"xml",
					"dockerfile",
					"markdown",
					"markdown_inline",
					"norg",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
