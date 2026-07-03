return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
      "theHamsta/nvim-dap-virtual-text",
      "leoluz/nvim-dap-go",
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "williamboman/mason.nvim",
        opts = {
          ensure_installed = { "php", "delve" },
          automatic_installation = true,
          handlers = {},
        },
      },
    },
    ft = { "php", "go" },
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, desc = "Conditional Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
      { "<leader>de", function() require("dapui").eval() end, mode = { "n", "v" }, desc = "Eval Expression" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      require("nvim-dap-virtual-text").setup({})
      require("dap-go").setup()

      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

      local sign = vim.fn.sign_define
      sign("DapBreakpoint", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
      sign("DapBreakpointCondition", { text = "", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
      sign("DapLogPoint", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
      sign("DapStopped", { text = "", texthl = "DiagnosticOk", linehl = "Visual", numhl = "" })
      sign("DapBreakpointRejected", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })

      local php_debug_path = vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js"
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { php_debug_path },
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
        },
        {
          type = "php",
          request = "launch",
          name = "Launch current script",
          program = "${file}",
          cwd = "${fileDirname}",
          port = 0,
          runtimeArgs = { "-dxdebug.start_with_request=yes" },
          env = {
            XDEBUG_MODE = "debug,develop",
            XDEBUG_CONFIG = "client_port=${port}",
          },
        },
      }
    end,
  },
}
