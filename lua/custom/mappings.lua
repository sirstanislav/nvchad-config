local M = {}

M.general = {

  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<M-p>"] = {
      ":lua require'telescope'.extensions.project.project{} <CR>",
      "Project manager",
    },
    ["<M-t>"] = { "<cmd> tabnext <CR>", "Go to next tab" },
    ["<M-b>"] = { "<cmd> tabprevious <CR>", "Go to previous tab" },
    ["<M-x>"] = { "<cmd> tabclose <CR>", "Close tab" },
    ["<M-t>n"] = { "<cmd> tabnew <CR>", "New tab" },
    ["<C-s>"] = { "<cmd> w | mksession! <CR>", "Save file" },
    ["<leader>s"] = { "<cmd> lua vim.lsp.buf.signature_help() <CR>", "Signature help" },
    ["K"] = {
      ":lua vim.lsp.buf.hover() <CR>",
      "LSP hover",
    },
    -- ["<leader>tr"] = {
    --   function()
    --     require("base46").toggle_transparency()
    --   end,
    --   "󰂵 Toggle transparency",
    -- },
  },
}

M.tabufline = {
  plugin = true,
  n = {
    -- close buffer + hide terminal buffer
    ["<M-w>"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["<S-M-w>"] = {
      function()
        require("nvchad_ui.tabufline").closeOtherBufs()
      end,
      "Close other buffers",
    },
    -- ["<S-M-w>"] = { "<cmd> %bd | e# <CR>", "Close others buffers" },
  },
}

M.git = {
  n = {
    ["<leader>gf"] = {
      "<cmd> Flogsplit <CR>",
      "Git branch view",
    },
    ["<leader>gh"] = {
      "<cmd> DiffviewFileHistory <CR>",
      "Open file history",
    },
    ["<leader>gc"] = {
      "<cmd> DiffviewClose <CR>",
      "Close file history",
    },
  },
}

M.dapui = {
  plugin = true,

  n = {
    ["<leader>du"] = {
      function()
        require("dapui").toggle { reset = true }
        -- local api = require "nvim-tree.api"
        -- if api.tree.open then
        --   api.tree.close()
        -- end
      end,
      "Dap UI",
    },

    ["<leader>de"] = {
      function()
        require("dapui").eval()
      end,
      "Eval",
    },
  },

  v = {
    ["<leader>de"] = {
      function()
        require("dapui").eval()
      end,
      "Eval",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dB"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      "Breakpoint Condition",
    },
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle Breakpoint",
    },
    ["<leader>dc"] = {
      function()
        -- require("jdtls").update_project_config()
        require("dapui").open { reset = true }
        require("dap").continue()
        -- local api = require "nvim-tree.api"
        -- if api.tree.open then
        --   api.tree.close()
        -- end
      end,
      "Continue",
    },
    ["<leader>dC"] = {
      function()
        require("dap").run_to_cursor()
      end,
      "Run to Cursor",
    },
    ["<leader>dg"] = {
      function()
        require("dap").goto_()
      end,
      "Go to line (no execute)",
    },
    ["<leader>di"] = {
      function()
        require("dap").step_into()
      end,
      "Step Into",
    },
    ["<leader>dj"] = {
      function()
        require("dap").down()
      end,
      "Down",
    },
    ["<leader>dk"] = {
      function()
        require("dap").up()
      end,
      "Up",
    },
    ["<leader>dl"] = {
      function()
        require("dap").run_last()
      end,
      "Run Last",
    },
    ["<leader>do"] = {
      function()
        require("dap").step_out()
      end,
      "Step Out",
    },
    ["<leader>dO"] = {
      function()
        require("dap").step_over()
      end,
      "Step Over",
    },
    ["<leader>dp"] = {
      function()
        require("dap").pause()
      end,
      "Pause",
    },

    ["<leader>dr"] = {
      function()
        require("dap").repl.toggle()
      end,
      "Toggle REPL",
    },

    ["<leader>ds"] = {
      function()
        require("dap").session()
      end,
      "Session",
    },

    ["<leader>dt"] = {
      function()
        require("dap").terminate()
      end,
      "Terminate",
    },

    ["<leader>dw"] = {
      function()
        require("dap.ui.widgets").hover()
      end,
      "Widgets",
    },
  },
}

return M
