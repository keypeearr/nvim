local opt = vim.opt

-- =========================================
-- General
-- =========================================

opt.encoding = "UTF-8"
opt.mouse = "a"
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- =========================================
-- UI
-- =========================================

opt.number = true
opt.relativenumber = true
opt.cursorline = true

opt.wrap = false
opt.linebreak = true

opt.scrolloff = 10
opt.sidescrolloff = 8

opt.signcolumn = "yes"
opt.termguicolors = true

opt.showmode = false
opt.ruler = false
opt.cmdheight = 1

opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0
opt.completeopt = "menu,menuone,noselect"

opt.showmatch = true
opt.matchtime = 2

opt.conceallevel = 2
opt.concealcursor = ""

opt.synmaxcol = 300
opt.winminwidth = 5

opt.laststatus = 3
opt.smoothscroll = true

opt.fillchars = {
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

opt.guicursor = "n-v-c-i:block"

-- =========================================
-- Indentation
-- =========================================

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.breakindent = true
opt.shiftround = true

-- =========================================
-- Search
-- =========================================

opt.ignorecase = true
opt.smartcase = true

opt.hlsearch = false
opt.incsearch = true

opt.path:append("**")

-- =========================================
-- Folding
-- =========================================

opt.foldmethod = "expr"
opt.foldlevel = 99

-- =========================================
-- Splits
-- =========================================

opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- =========================================
-- Files
-- =========================================

opt.backup = false
opt.writebackup = false
opt.swapfile = false

opt.undofile = true
opt.undolevels = 10000

local undodir = vim.fn.expand("~/.vim/undodir")
opt.undodir = undodir

if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

opt.autoread = true
opt.autowrite = true

-- =========================================
-- Timing / Performance
-- =========================================

opt.updatetime = 300
opt.timeoutlen = vim.g.vscode and 1000 or 300
opt.ttimeoutlen = 0

opt.redrawtime = 10000
opt.maxmempattern = 20000

-- =========================================
-- Behavior
-- =========================================

opt.hidden = true
opt.errorbells = false
opt.backspace = "indent,eol,start"

opt.autochdir = false
opt.virtualedit = "block"

opt.selection = "exclusive"
opt.modifiable = true

opt.iskeyword:append("-")

opt.jumpoptions = "view"

-- =========================================
-- Command Line
-- =========================================

opt.wildmenu = true
opt.wildmode = "longest:full,full"

opt.wildignore:append({
	"*.o",
	"*.obj",
	"*.pyc",
	"*.class",
	"*.jar",
})

opt.shortmess:append({
	W = true,
	I = true,
	c = true,
	C = true,
})

-- =========================================
-- Formatting
-- =========================================

opt.formatoptions = "jcroqlnt"

-- =========================================
-- Grep
-- =========================================

opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- =========================================
-- Diff
-- =========================================

opt.diffopt:append("linematch:60")

-- =========================================
-- Globals
-- =========================================

vim.g.autoformat = true
vim.g.trouble_lualine = true
vim.g.have_nerd_font = true
vim.g.markdown_recommended_style = 0

-- =========================================
-- Filetypes
-- =========================================

vim.filetype.add({
	extension = {
		env = "dotenv",
	},

	filename = {
		[".env"] = "dotenv",
		["env"] = "dotenv",
	},

	pattern = {
		["[jt]sconfig.*.json"] = "jsonc",
		["%.env%.[%w_.-]+"] = "dotenv",
	},
})
