local plugins = {
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"ggandor/leap.nvim",
		lazy = false,
		config = function(_, opts)
			local leap = require("leap")
			leap.add_default_mappings()
		end,
  },
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"rust-analyzer",
				"clangd",
				"pyright",
				"cmake-language-server",
				"json-lsp",
				"codelldb",
				"bash-language-server",
				"nil",
				"stylua",
				"prettier",
			},
		},
	},
	{
		-- For format on save
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "rust", "toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			crates.show()
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		dependencies = "neovim/nvim-lspconfig",
		ft = "rust",
		opts = function()
			return require("custom.configs.rust-tools")
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			local M = require("plugins.configs.cmp")
			table.insert(M.sources, { name = "crates" })
			return M
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			require("dapui").setup()
			require("custom.configs.dapui")
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = "rcarriga/nvim-dap-ui",
		ft = { "rust", "c", "python" },
		config = true,
	},
	{ "nmac427/guess-indent.nvim", config = true, lazy = false },

	-- Smooth scrolling
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
			require("neoscroll.config").set_mappings({
				["<C-Up>"] = { "scroll", { "-vim.wo.scroll", "true", "100" } },
				["<C-Down>"] = { "scroll", { "vim.wo.scroll", "true", "100" } },
			})
		end,
		lazy = false,
	},

	-- Undo tree
	{ "simnalamburt/vim-mundo", lazy = false },

	-- NVChad already comes with treesitter, this overrides the `ensure_installed` for languages I use.
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"toml",
				"python",
				"nix",
				"json",
				"yaml",
				"c",
				"rust",
				"bash",
				"awk",
				"make",
				"cmake",
				"dockerfile",
			},
		},
	},
	-- Tracking func headers
	{ "nvim-treesitter/nvim-treesitter-context", lazy = true, dependencies = "nvim-treesitter/nvim-treesitter" },

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = "nvim-lua/plenary.nvim",
	},
}
return plugins
