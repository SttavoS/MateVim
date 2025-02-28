return {
  {
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			dashboard = {
				enabled = true,
				preset = {
					header = [[
███╗   ███╗ █████╗ ████████╗███████╗██╗   ██╗██╗███╗   ███╗
████╗ ████║██╔══██╗╚══██╔══╝██╔════╝██║   ██║██║████╗ ████║
██╔████╔██║███████║   ██║   █████╗  ██║   ██║██║██╔████╔██║
██║╚██╔╝██║██╔══██║   ██║   ██╔══╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚═╝ ██║██║  ██║   ██║   ███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                            ]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
				},
			},
			animate = { enabled = true },
			bigfile = { enabled = true },
			bufdelete = { enabled = true },
			indent = {
				priority = 1,
				enabled = true,
				char = "│",
			},
			input = { enabled = true },
			notifier = { enabled = true },
			picker = {
				enabled = true,
			},
			quickfile = { enabled = true },
			rename = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
		keys = {
			-- Buffer
			{
				"<leader>bd",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Buffer",
			},
			-- Git
			{
				"<leader>gb",
				function()
					Snacks.git.blame_line()
				end,
				desc = "Git Blame Line",
			},
			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gl",
				function()
					Snacks.lazygit.log()
				end,
				desc = "Lazygit Log (cwd)",
			},
			-- Refactor
			{
				"<leader>cR",
				function()
					Snacks.rename.rename_file()
				end,
				desc = "Rename File",
			},
			-- Notification
			{
				"<leader>n",
				function()
					Snacks.notifier.show_history()
				end,
				desc = "Notification History",
			},
			{
				"<leader>dn",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss All Notifications",
			},
			-- Picker
			{
				"<leader>,",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>/",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>:",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader><space>",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			-- File Explorer
			{
				"<leader>e",
				function()
					Snacks.picker.explorer()
				end,
				desc = "Open File Explorer",
			},
			-- find
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fc",
				function()
					Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Config File",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.git_files()
				end,
				desc = "Find Git Files",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent",
			},
			-- git
			{
				"<leader>gc",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Git Log",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},
			-- Grep
			{
				"<leader>sb",
				function()
					Snacks.picker.lines()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>sB",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "Grep Open Buffers",
			},
			{
				"<leader>sg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>sw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Visual selection or word",
				mode = { "n", "x" },
			},
		},
	},
}
