return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
    config = true,
		opts = {
			overrides = {
				["@tag"] = { fg = "#8ec07c", bg = "NONE", bold = false, italic = false },
				["@tag.builtin"] = { fg = "#8ec07c", bg = "NONE", bold = false, italic = false },
				["@tag.attribute"] = { fg = "#fabd2f", bg = "NONE", bold = false, italic = false },
				["@tag.delimiter"] = { fg = "#83a598", bg = "NONE", bold = false, italic = false },
				["@string.javascript"] = { fg = "#b8bb26", bg = "NONE", bold = false, italic = false },
			},
			dim_inactive = false,
			transparent_mode = false,
		},
	},
}
