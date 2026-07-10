return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = {
			"DiffviewOpen",
			"DiffviewClose",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewFileHistory",
		},
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff view (index)" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
			{ "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch history" },
			{ "<leader>gx", "<cmd>DiffviewClose<cr>", desc = "Fechar diffview" },
			{ "<leader>gm", "<cmd>DiffviewOpen HEAD...ORIG_HEAD<cr>", desc = "Ver merge diff" },
		},
		opts = function()
			local actions = require("diffview.actions")
			return {
				enhanced_diff_hl = true,
				view = {
					merge_tool = {
						layout = "diff3_mixed",
						disable_diagnostics = true,
					},
				},
				keymaps = {
					view = {
						{ "n", "<leader>co", actions.conflict_choose("ours"), { desc = "Accept ours (local)" } },
						{ "n", "<leader>ct", actions.conflict_choose("theirs"), { desc = "Aceitar theirs (remoto)" } },
						{ "n", "<leader>cb", actions.conflict_choose("all"), { desc = "Accept both" } },
						{ "n", "<leader>cn", actions.conflict_choose("none"), { desc = "Discard both" } },
						{ "n", "]x", actions.next_conflict, { desc = "Next conflict" } },
						{ "n", "[x", actions.prev_conflict, { desc = "Previous conflict" } },
					},
					file_panel = {
						{ "n", "j", actions.next_entry, { desc = "Next file" } },
						{ "n", "k", actions.prev_entry, { desc = "Previous file" } },
						{ "n", "<cr>", actions.select_entry, { desc = "Open file" } },
						{ "n", "s", actions.toggle_stage_entry, { desc = "Stage/unstage" } },
						{ "n", "R", actions.refresh_files, { desc = "Refresh files" } },
					},
				},
			}
		end,
	},
	{
		"lukas-reineke/virt-column.nvim",
		opts = {
			char = "┆",
			virtcolumn = "80",
			highlight = { "NonText" },
		},
	},
	{
		"MagicDuck/grug-far.nvim",
		opts = { headerMaxWidth = 80 },
		cmd = "GrugFar",
		keys = {
			{
				"<leader>sr",
				function()
					local grug = require("grug-far")
					local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
					grug.open({
						transient = true,
						prefills = {
							filesFilter = ext and ext ~= "" and "*." .. ext or nil,
						},
					})
				end,
				mode = { "n", "v" },
				desc = "Search and Replace",
			},
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
	},
	{
		"folke/trouble.nvim",
		opts = {
			modes = {
				lsp = {
					win = { position = "right" },
				},
			},
		}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"LintaoAmons/bookmarks.nvim",
		dependencies = {
			{ "kkharji/sqlite.lua" },
			{ "folke/snacks.nvim" },
		},
		config = function()
			require("bookmarks").setup({
				signs = {
					mark = {
						icon = "󰃁",
						color = "#83a598", -- gruvbox blue
						line_bg = "none", -- no line highlight, gutter icon only
					},
				},
			})
		end,
		keys = {
			{ "<leader>ma", "<cmd>BookmarksMark<cr>", desc = "Add/toggle bookmark" },
			{ "<leader>mm", "<cmd>BookmarksGoto<cr>", desc = "Go to bookmark" },
			{ "<leader>ml", "<cmd>BookmarksLists<cr>", desc = "Pick bookmark list" },
			{ "<leader>mn", "<cmd>BookmarksNewList<cr>", desc = "New bookmark list" },
			{ "<leader>mt", "<cmd>BookmarksTree<cr>", desc = "Bookmark tree view" },
		},
	},
}
