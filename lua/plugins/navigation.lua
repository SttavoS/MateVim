return {
  {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle", "AerialOpen", "AerialNavToggle" },
    keys = {
      { "<leader>cS", "<cmd>AerialToggle!<cr>", desc = "Toggle Aerial Outline" },
      { "<leader>cN", "<cmd>AerialNavToggle<cr>", desc = "Aerial Nav" },
    },
    opts = {
      backends = { "lsp", "treesitter", "markdown", "man" },
      layout = { default_direction = "right", min_width = 28 },
      show_guides = true,
      filter_kind = false,
      attach_mode = "global",
      on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<cr>", { buffer = bufnr, desc = "Aerial Prev" })
        vim.keymap.set("n", "}", "<cmd>AerialNext<cr>", { buffer = bufnr, desc = "Aerial Next" })
      end,
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = function()
      local h = function() return require("harpoon") end
      return {
        { "<leader>ha", function() h():list():add() end, desc = "Harpoon Add File" },
        { "<leader>hh", function() h().ui:toggle_quick_menu(h():list()) end, desc = "Harpoon Menu" },
        { "<leader>1", function() h():list():select(1) end, desc = "Harpoon 1" },
        { "<leader>2", function() h():list():select(2) end, desc = "Harpoon 2" },
        { "<leader>3", function() h():list():select(3) end, desc = "Harpoon 3" },
        { "<leader>4", function() h():list():select(4) end, desc = "Harpoon 4" },
        { "<leader>hn", function() h():list():next() end, desc = "Harpoon Next" },
        { "<leader>hp", function() h():list():prev() end, desc = "Harpoon Prev" },
      }
    end,
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoTrouble", "TodoTelescope", "TodoQuickFix", "TodoLocList" },
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
      { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
      { "<leader>st", function() Snacks.picker.todo_comments() end, desc = "Todo" },
    },
    opts = {},
  },
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle", "UndotreeShow" },
    keys = {
      { "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
    },
    init = function()
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
}
