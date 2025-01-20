local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
local api = vim.api

require("config.lazy")
require("autoclose").setup()
require("mason").setup()

local oil = require("oil")
oil.setup()

local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		python = { "isort", "autopep8" },
		lua = { "stylua" },
	},
})

local lint = require("lint")
lint.linters_by_ft = {
	python = { "flake8" },
}

local lint_augroup = api.nvim_create_augroup("lint", { clear = true })
api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

vim.keymap.set("n", "<Leader>l", function() 
  lint.try_lint()
end)

cmd.colorscheme("retrobox")

g.mapleader = " "
vim.keymap.set("n", "<Leader>e", oil.toggle_float)
vim.keymap.set({ "n", "v" }, "<Leader>mp", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 6000,
	})
end)

opt.clipboard = "unnamedplus"
opt.cursorline = true -- highlight current line
opt.encoding = "utf-8"
opt.expandtab = true -- spaces instead of tabs
opt.hidden = true -- enable background buffers
opt.ignorecase = true -- ignore case in search
opt.joinspaces = false -- no double spaces with join
opt.list = true -- show some invisible characters
opt.maxmempattern = 1000 -- for Riv
opt.mouse = "nv" -- Enable mouse in normal and visual modes
opt.number = true -- show line numbers
opt.relativenumber = true -- number relative to current line
opt.scrolloff = 4 -- lines of context
opt.shiftround = true -- round indent
opt.shiftwidth = 2 -- size of indent
opt.sidescrolloff = 8 -- columns of context
opt.smartcase = true -- do not ignore case with capitals
opt.smartindent = true -- insert indents automatically
opt.splitbelow = true -- put new windows below current
opt.splitright = true -- put new vertical splits to right
