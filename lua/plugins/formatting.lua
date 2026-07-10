return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true })
        end,
        mode = { "n", "v" },
        desc = "Format buffer",
      },
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
    },
    opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
      },
      format_on_save = function(bufnr)
        local ft = vim.bo[bufnr].filetype
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat or vim.g["disable_autoformat_" .. ft] then
          return
        end
        return { timeout_ms = 3000, lsp_format = "fallback" }
      end,
      formatters = {
        php_cs_fixer = {
          args = { "fix", "--rules=@PSR12", "--using-cache=no", "$FILENAME" },
          exit_codes = { 0, 1 },
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        php = { "php_cs_fixer" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
      },
    },
    init = function()
      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          vim.b.disable_autoformat = true
        elseif args.args ~= "" then
          vim.g["disable_autoformat_" .. args.args] = true
        else
          vim.g.disable_autoformat = true
        end
      end, { desc = "Disable autoformat-on-save (optional: filetype)", bang = true, nargs = "?" })

      vim.api.nvim_create_user_command("FormatEnable", function(args)
        if args.args ~= "" then
          vim.g["disable_autoformat_" .. args.args] = false
        else
          vim.b.disable_autoformat = false
          vim.g.disable_autoformat = false
        end
      end, { desc = "Re-enable autoformat-on-save (optional: filetype)", nargs = "?" })
    end,
  },
}
