local M = {}

M.harpoon = {
	n = {
		["<leader>mn"] = {
			function()
				require("harpoon.mark").add_file()
			end,
			"Mark file",
		},
		["<leader>ma"] = {
			function()
				require("harpoon.ui").nav_file(1)
			end,
			"Harpoon 1",
		},
		["<leader>mr"] = {
			function()
				require("harpoon.ui").nav_file(2)
			end,
			"Harpoon 2",
		},
		["<leader>ms"] = {
			function()
				require("harpoon.ui").nav_file(3)
			end,
			"Harpoon 3",
		},
		["<leader>mt"] = {
			function()
				require("harpoon.ui").nav_file(4)
			end,
			"Harpoon 4",
		},
		["<leader>mm"] = {
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			"Harpoon menu",
		},
	},
}

M.lsp = {
	n = {
		["<leader>lf"] = {
			function()
				vim.lsp.buf.format()
			end,
			"Format file",
		},
	},
}

M.dap = {
	n = {
		["<leader>db"] = {
			"<cmd>DapToggleBreakpoint<CR>",
			"Toggle breakpoint",
		},
		["<leader>ds"] = {
			function()
				require("dapui").toggle()
			end,
			"Show/hide debug sidebar",
		},
		["<leader>dn"] = {
			"<cmd>DapStepOut<CR>",
			"Step out",
		},
		["<leader>de"] = {
			"<cmd>DapStepOver<CR>",
			"Step over",
		},
		["<leader>di"] = {
			"<cmd>DapContinue<CR>",
			"Continue",
		},
		["<leader>do"] = {
			"<cmd>DapStepInto<CR>",
			"Step into",
		},
		["<leader>dk"] = {
			"<cmd>DapTerminate<CR>",
			"Terminate debugging",
		},
	},
}

M.nvterm = {
	plugin = true,
	n = {
		["<leader>gg"] = {
			function()
				require("nvterm.terminal").new("float")
				require("nvterm.terminal").send("lg", "float")
			end,
			"Lazygit",
		},
	},
}

return M
