vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

-- Clear highlights
set("n", "<Esc>", "<cmd>nohlsearch<CR>", {
	desc = "Clear Search Highlight",
})

-- Diagnostics
set("n", "<leader>Q", vim.diagnostic.setloclist, {
	desc = "Open Diagnostic [Q]uickfix List",
})

-- Buffer
set("n", "<leader>q", "<cmd>bdelete!<CR>", {
	desc = "[Q]uit Current Buffer",
	noremap = true,
	silent = true,
})

-- Splits
set("n", "<leader>H", "<cmd>split<CR>", {
	desc = "[H]orizontal Split",
	noremap = true,
	silent = true,
})

set("n", "<leader>V", "<cmd>vsplit<CR>", {
	desc = "[V]ertical Split",
	noremap = true,
	silent = true,
})

-- Split Navigation
set("n", "<C-j>", "<C-w><C-j>", {
	desc = "Move Down ([J])",
	noremap = true,
	silent = true,
})

set("n", "<C-k>", "<C-w><C-k>", {
	desc = "Move Up ([K])",
	noremap = true,
	silent = true,
})

set("n", "<C-h>", "<C-w><C-h>", {
	desc = "Move Left ([H])",
	noremap = true,
	silent = true,
})

set("n", "<C-l>", "<C-w><C-l>", {
	desc = "Move Right ([L])",
	noremap = true,
	silent = true,
})

-- Resize Splits
set("n", "<leader>rh", "<C-w>5<", {
	desc = "[R]esize Left ([H])",
	noremap = true,
	silent = true,
})

set("n", "<leader>rl", "<C-w>5>", {
	desc = "[R]esize Right ([L])",
	noremap = true,
	silent = true,
})

set("n", "<leader>rk", "<C-w>+", {
	desc = "[R]esize Up ([K])",
	noremap = true,
	silent = true,
})

set("n", "<leader>rj", "<C-w>-", {
	desc = "[R]esize Down ([J])",
	noremap = true,
	silent = true,
})
