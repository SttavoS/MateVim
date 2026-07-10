return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    opts_extend = { "linters_by_ft" },
    opts = {
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        vue = { "eslint_d" },
        php = { "phpstan" },
        sql = { "sqlfluff" },
      },
      linters = {},
    },
    config = function(_, opts)
      local lint = require("lint")

      for name, linter in pairs(opts.linters or {}) do
        if type(linter) == "table" and type(lint.linters[name]) == "table" then
          lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name], linter)
        else
          lint.linters[name] = linter
        end
      end

      lint.linters_by_ft = opts.linters_by_ft

      vim.api.nvim_create_autocmd(opts.events, {
        group = vim.api.nvim_create_augroup("matevim_nvim_lint", { clear = true }),
        callback = function()
          if vim.bo.buftype ~= "" or vim.bo.filetype == "" then
            return
          end
          lint.try_lint()
        end,
      })
    end,
  },
}
