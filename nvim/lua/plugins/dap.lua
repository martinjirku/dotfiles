return {
  {
    "mfussenegger/nvim-dap",
    opts = {},
    keys = {
      {
        "<leader>ds",
        function()
          require("dap").continue()
        end,
        desc = "Start/Continue debugging",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint",
      },
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Set conditional breakpoint",
      },
      {
        "<leader>dl",
        function()
          require("dap").step_into()
        end,
        desc = "Step into",
      },
      {
        "<leader>dj",
        function()
          require("dap").step_over()
        end,
        desc = "Step over",
      },
      {
        "<leader>dk",
        function()
          require("dap").step_out()
        end,
        desc = "Step out",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.open()
        end,
        desc = "Open REPL",
      },
      {
        "<leader>dq",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate debug session",
      },
      {
        "<leader>dL",
        function()
          require("dap.ext.vscode").load_launchjs(nil, {})
          require("dap").continue()
        end,
        desc = "Start debug session from launch.json",
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    opts = {},
    keys = {},
  },
}
