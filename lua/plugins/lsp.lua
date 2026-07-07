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
		dependencies = { "saghen/blink.cmp" },
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
			local capabilities = require("blink.cmp").get_lsp_capabilities()

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

			vim.diagnostic.config({
				severity_sort = true,
				underline = true,
				update_in_insert = false,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = " ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
				float = {
					border = "rounded",
					source = "if_many",
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("matevim_lsp_attach", { clear = true }),
				callback = function(ev)
					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
					end
					local client = vim.lsp.get_client_by_id(ev.data.client_id)

					map("n", "K", vim.lsp.buf.hover, "Hover")
					map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
					map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
					map("n", "gr", vim.lsp.buf.references, "References")
					map("n", "gi", vim.lsp.buf.implementation, "Implementation")
					map("n", "gy", vim.lsp.buf.type_definition, "Type Definition")
					map("n", "gK", vim.lsp.buf.signature_help, "Signature Help")
					vim.keymap.set("n", "<leader>cr", function()
						if pcall(require, "inc_rename") then
							return ":IncRename " .. vim.fn.expand("<cword>")
						end
						vim.schedule(vim.lsp.buf.rename)
						return ""
					end, { buffer = ev.buf, desc = "Rename", expr = true })
					map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("n", "<leader>ci", function()
						vim.lsp.buf.code_action({
							context = { only = { "source.organizeImports" }, diagnostics = {} },
							apply = true,
						})
					end, "Organize Imports")
					map("n", "<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")
					map("n", "]d", function()
						vim.diagnostic.jump({ count = 1, float = true })
					end, "Next Diagnostic")
					map("n", "[d", function()
						vim.diagnostic.jump({ count = -1, float = true })
					end, "Previous Diagnostic")

					if client and client:supports_method("textDocument/inlayHint") then
						map("n", "<leader>uh", function()
							local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf })
							vim.lsp.inlay_hint.enable(not enabled, { bufnr = ev.buf })
						end, "Toggle Inlay Hints")
					end
				end,
			})
		end,
	},
}
