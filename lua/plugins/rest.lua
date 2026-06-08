return {
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>rs", function() require("kulala").run() end, desc = "Send Request" },
      { "<leader>rt", function() require("kulala").toggle_view() end, desc = "Toggle Body/Headers View" },
      { "<leader>rc", function() require("kulala").copy() end, desc = "Copy as cURL" },
      { "<leader>rn", function() require("kulala").jump_next() end, desc = "Next Request" },
      { "<leader>rp", function() require("kulala").jump_prev() end, desc = "Previous Request" },
      { "<leader>ri", function() require("kulala").inspect() end, desc = "Inspect Request" },
      { "<leader>rq", function() require("kulala").close() end, desc = "Close Kulala" },
    },
    ft = { "http", "rest" },
    opts = {
      default_view = "body",
      default_env = "dev",
      debug = false,
      contenttypes = {
        ["application/json"] = {
          ft = "json",
          formatter = { "jq", "." },
          pathresolver = require("kulala.parser.jsonpath").parse,
        },
      },
    },
  },
}
