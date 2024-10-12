local options = {
	compatible = false,
	backup = false,
	swapfile = false,
	clipboard = "unnamedplus",
	completeopt = { "menuone","noselect" },
	cmdheight = 1,
	splitright = true,
	splitbelow = true,
	number = true,
	numberwidth = 2,
	signcolumn = "yes",
	smartindent = true,
	shiftwidth = 4,
	tabstop = 4,
	expandtab = false,
	cursorline = true,
	wrap = false,
	wildmenu = true,
	pumheight = 10,
	is = true,
	hls = false,
	ignorecase = true,
	scrolloff = 3,
	sidescrolloff = 5,
}

for k,v in pairs(options) do
	vim.opt[k] = v
end


-- other options

vim.netrw_banner = 0 -- no banner
vim.g.netrw_liststyle = 3 -- tree view
vim.opt.path:append { "**" }

vim.cmd([[
set guicursor=i:block
]])
