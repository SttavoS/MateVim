return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    build = (function()
      if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
        return
      end
      return "make install_jsregexp"
    end)(),
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    version = "*",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    opts_extend = { "sources.default" },
    opts = {
      snippets = { preset = "luasnip" },
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      },
      appearance = { nerd_font_variant = "mono" },
      signature = { enabled = true },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        menu = {
          border = "rounded",
          draw = { treesitter = { "lsp" } },
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          sql = { "lsp", "snippets", "dadbod", "buffer" },
          mysql = { "lsp", "snippets", "dadbod", "buffer" },
          plsql = { "lsp", "snippets", "dadbod", "buffer" },
        },
        providers = {
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
      },
    },
  },
}
