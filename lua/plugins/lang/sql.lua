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
      formatters = {
        sql_formatter = {
          prepend_args = function()
            local config = vim.fn.json_encode({
              language = "postgresql",
              keywordCase = "upper",
              dataTypeCase = "upper",
              functionCase = "upper",
              identifierCase = "preserve",
              indentStyle = "standard",
              logicalOperatorNewline = "before",
              expressionWidth = 80,
              linesBetweenQueries = 2,
              denseOperators = false,
              newlineBeforeSemicolon = false,
              tabWidth = 2,
              useTabs = false,
            })
            return { "--config", config }
          end,
        },
      },
      formatters_by_ft = {
        sql = { "sql_formatter" },
        mysql = { "sql_formatter" },
        plsql = { "sql_formatter" },
      },
    },
  },
}
