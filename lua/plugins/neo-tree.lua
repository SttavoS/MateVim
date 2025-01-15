return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  keys = {
    {
      "<leader>e",
      ":Neotree filesystem reveal left<CR>",
      desc = "Open File Explorer",
    },
    {
      "<leader>et",
      "<cmd>Neotree toggle<CR>",
      desc = "Toggle File Explorer",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",            -- Optional image support in preview window: See `# Preview Mode` for more information
  },
}
