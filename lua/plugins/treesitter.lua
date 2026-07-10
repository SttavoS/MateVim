return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local parsers = {
        "bash",
        "css",
        "diff",
        "dockerfile",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "html",
        "http",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "phpdoc",
        "regex",
        "scss",
        "sql",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
      }

      require("nvim-treesitter").install(parsers)

      local ft_to_lang = {
        sh = "bash",
        javascriptreact = "javascript",
        typescriptreact = "tsx",
        help = "vimdoc",
        gitconfig = "gitcommit",
      }

      local fts = {}
      for _, p in ipairs(parsers) do
        table.insert(fts, p)
      end
      for ft, _ in pairs(ft_to_lang) do
        table.insert(fts, ft)
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = fts,
        callback = function(ev)
          local lang = ft_to_lang[ev.match] or ev.match
          pcall(vim.treesitter.start, ev.buf, lang)
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
