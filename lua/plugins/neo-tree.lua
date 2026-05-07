return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	enabled = false,
	keys = {
		{
			"<leader>e",
			":Neotree filesystem reveal left<CR>",
			desc = "Open File Explorer",
		},
		{
			"<leader>et",
			"<cmd>Neotree toggle<CR>",
			desc = "Toggle File Explorer",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = false, -- when true, they will just be displayed differently than normal items
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {
					".git",
				},
				always_show = { -- remains visible even if other settings would normally hide it
					".gitignored",
				},
				always_show_by_pattern = { -- uses glob style patterns
					".env*",
				},
				never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
					".DS_Store",
					"thumbs.db",
				},
			},
		},
	},
}
