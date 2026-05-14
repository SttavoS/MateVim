return {
  {
    "williamboman/mason.nvim",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "typescript-language-server",
        "css-lsp",
        "vue-language-server",
        "prettier",
        "eslint-lsp",
        "eslint_d",
        "js-debug-adapter",
        "phpactor",
        "php-cs-fixer",
        "phpstan",
        "sqlfluff",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
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
    opts = {
      servers = {
        lua_ls = {},
        ts_ls = {
          filetypes = {
            "typescript",
            "javascript",
            "javascriptreact",
            "typescriptreact",
            "vue",
          },
        },
        cssls = {},
        vue_ls = {},
        phpactor = {},
      },
    },
    config = function(_, opts)
      local mason_registry = require("mason-registry")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      if mason_registry.is_installed("vue-language-server") then
        local vue_path = vim.fn.stdpath("data")
          .. "/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin"
        opts.servers.ts_ls = opts.servers.ts_ls or {}
        opts.servers.ts_ls.init_options = {
          plugins = { { name = "@vue/typescript-plugin", location = vue_path, languages = { "vue" } } },
        }
      end

      vim.lsp.config("*", { capabilities = capabilities })

      for name, cfg in pairs(opts.servers) do
        if cfg and next(cfg) ~= nil then
          vim.lsp.config(name, cfg)
        end
        vim.lsp.enable(name)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("matevim_lsp_attach", { clear = true }),
        callback = function(ev)
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
          end
          map("n", "K", vim.lsp.buf.hover, "Hover")
          map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
        end,
      })
    end,
  },
}
