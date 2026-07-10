return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			local palette = {
				bg0 = "#282828",
				red = "#cc241d",
				green = "#98971a",
				yellow = "#d79921",
				blue = "#458588",
				purple = "#b16286",
				aqua = "#689d6a",
				gray = "#928374",
				orange = "#d65d0e",
				bright_red = "#fb4934",
				bright_green = "#b8bb26",
				bright_yellow = "#fabd2f",
				bright_blue = "#83a598",
				bright_purple = "#d3839b",
				bright_aqua = "#8ec07c",
				bright_gray = "#a89984",
				bright_orange = "#fe8019",
				fg0 = "#fbf1c7",
				fg1 = "#ebdbb2",
				fg3 = "#bdae93",
				light_yellow = "#f8e1aa",
			}

			require("gruvbox").setup({
				overrides = {
					-- Punctuation
					["@punctuation.bracket"] = { fg = palette.light_yellow, bg = "NONE" },
					["@punctuation.delimiter"] = { fg = palette.fg1, bg = "NONE" },
					["@punctuation.special"] = { fg = palette.fg1, bg = "NONE" },
					["@punctuation"] = { fg = palette.fg1, bg = "NONE" },

					-- Constructors and types
					["@constructor"] = { fg = palette.bright_yellow, bg = "NONE" },

					-- Variables / parameters / fields in blue
					["@variable"] = { fg = palette.bright_blue, bg = "NONE" },
					["@variable.member"] = { fg = palette.bright_blue, bg = "NONE" },
					["@variable.parameter"] = { fg = palette.bright_blue, bg = "NONE" },
					["@property"] = { fg = palette.bright_blue, bg = "NONE" },

					-- Operators neutral
					["@operator"] = { fg = palette.fg1, bg = "NONE" },

					-- Html, Jsx, Vue
					["@tag"] = { fg = palette.bright_aqua, bg = "NONE", bold = false, italic = false },
					["@tag.builtin"] = { fg = palette.bright_aqua, bg = "NONE", bold = false, italic = false },
					["@tag.attribute"] = { fg = palette.bright_yellow, bg = "NONE", bold = false, italic = false },
					["@tag.delimiter"] = { fg = palette.bright_blue, bg = "NONE", bold = false, italic = false },
					["@string.javascript"] = { fg = palette.bright_green, bg = "NONE", bold = false, italic = false },
					["@lsp.type.class.vue"] = { fg = palette.bright_purple, bg = "NONE", bold = false, italic = true },

					-- snacks.dashboard
					SnacksDashboardDesc = { fg = palette.fg1 },
					-- snacks.picker
					SnacksPickerDirectory = { fg = palette.fg1 },
					SnacksPickerDir = { fg = palette.gray },
					SnacksPickerPathHidden = { fg = palette.gray },
					SnacksPickerGitStatusUntracked = { fg = palette.green },
				},
				dim_inactive = false,
				transparent_mode = false,
			})

			vim.o.background = "dark" -- or "light" for light mode
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
}
