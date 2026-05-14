return {
  {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"lua",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"scss",
				"vue",
				"php",
				"sql",
				"json",
				"yaml",
				"xml",
				"dockerfile",
				"markdown",
				"markdown_inline",
			},
			highlight = { enable = true },
			indent = { enable = true },
		},
	},
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    opts = {
      ensure_installed = {
        "lua_language_server",
        "typescript-language-server",
        "css_lsp",
        "vue_language_server",
        "prettier",
        "eslint-lsp",
        "js-debug-adapter",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local mason_registry = require("mason-registry")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("*", { capabilities = capabilities })

      local ts_ls_opts = {
        filetypes = {
          "typescript",
          "javascript",
          "javascriptreact",
          "typescriptreact",
          "vue",
        },
      }
      if mason_registry.is_installed("vue-language-server") then
        local vue_path = vim.fn.stdpath("data")
          .. "/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin"
        ts_ls_opts.init_options = {
          plugins = { { name = "@vue/typescript-plugin", location = vue_path, languages = { "vue" } } },
        }
      end
      vim.lsp.config("ts_ls", ts_ls_opts)

      vim.lsp.config("elixirls", {
        cmd = { "/home/sttavos/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
      })

      vim.lsp.enable({ "lua_ls", "ts_ls", "cssls", "vue_ls", "phpactor", "elixirls" })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
