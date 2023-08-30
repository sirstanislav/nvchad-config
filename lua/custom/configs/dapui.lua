local dapui = require "dapui"

dapui.setup {
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.25,
        },
        {
          id = "breakpoints",
          size = 0.25,
        },
        {
          id = "stacks",
          size = 0.25,
        },
        {
          id = "watches",
          size = 0.25,
        },
      },
      position = "right",
      size = 0.25,
    },
    {
      elements = {
        {
          id = "repl",
          size = 0.3,
        },
        {
          id = "console",
          size = 0.7,
        },
      },
      position = "bottom",
      size = 0.25,
    },
  },
}
