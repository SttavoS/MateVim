return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "sqls",
        "sql-formatter",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sqls = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sql_formatter" },
      },
    },
  },
}
