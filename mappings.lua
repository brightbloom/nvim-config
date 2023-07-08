local M = {}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd>DapToggleBreakpoint<CR>",
      "Toggle breakpoint"
    },
    ["<leader>ds"] = {
      function ()
        require('dapui').toggle()
      end,
      "Show/hide debug sidebar"
    }
  }
}

M.nvterm = {
  plugin = true,
  n = {
    ["<leader>gg"] = {function ()
      require("nvterm.terminal").new("float")
      require("nvterm.terminal").send("lg", "float")
    end,
    'Lazygit'}
  }
}

return M
