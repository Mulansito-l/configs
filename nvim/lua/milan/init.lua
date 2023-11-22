require("milan.remap")
require("milan.lazy")
require("milan.set")
require("lazy").setup(
{{"catppuccin/nvim", name = "catppuccin", priority = 1000, lazy=true, background ={dar = "macchiato"}},
{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
config = function ()
	local configs = require("nvim-treesitter.configs")
	
	configs.setup({
		ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
	
	})
	end
},{"mbbill/undotree"},
{"williamboman/mason.nvim"},
{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
{'neovim/nvim-lspconfig'},
{'hrsh7th/cmp-nvim-lsp'},
{'hrsh7th/nvim-cmp'},
{'L3MON4D3/LuaSnip'},
{'williamboman/mason-lspconfig.nvim'},
{'neovim/nvim-lspconfig'},
{"theprimeagen/harpoon"},
{"andweeb/presence.nvim"},
{"elkowar/yuck.vim"}})


local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)
require("mason").setup()
require("mason-lspconfig").setup()
require('lspconfig').lua_ls.setup({})
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').clangd.setup({})
require('lspconfig').pyright.setup({})
vim.cmd.colorscheme "catppuccin"
