return {
  {
    "tpope/vim-dadbod",
    cmd = { "DB", "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    dependencies = {
      { "kristijanhusak/vim-dadbod-ui", cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" } },
      "kristijanhusak/vim-dadbod-completion",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_win_position = "left"
      vim.g.db_ui_use_nvim_notify = 1
      vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"
    end,
    keys = {
      { "<leader>D", "<cmd>DBUIToggle<cr>", desc = "Toggle Database UI" },
      { "<leader>Df", "<cmd>DBUIFindBuffer<cr>", desc = "DBUI Find Buffer" },
      { "<leader>Da", "<cmd>DBUIAddConnection<cr>", desc = "DBUI Add Connection" },
    },
  },
}
