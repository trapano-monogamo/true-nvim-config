local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer. Close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print "Could not load packer module..."
	return
end

packer.init{
	display = {
		open_fn = function()
			return require('packer.util').float { border = "rounded" }
		end,
	},
}

-- install plugins

return packer.startup(function(use)
	use { "wbthomason/packer.nvim" --[[ have packer manage itself --]] }
	use "nvim-lua/popup.nvim"

	-- colorschemes
	use "lunarvim/colorschemes"
	use { "ellisonleao/gruvbox.nvim" }
	use "folke/tokyonight.nvim"
	use "metalelf0/jellybeans-nvim"

	-- quality of life
	use "nvim-treesitter/nvim-treesitter"
	use "junegunn/fzf.vim"
	-- use { "junegunn/fzf", run = "fzf#install()" }
	--use { "nvim-tree/nvim-tree.lua", requires = {{ "nvim-tree/nvim-web-devicons" }} }

	-- LSP
	use "neovim/nvim-lspconfig"
	use "williamboman/nvim-lsp-installer"

	-- other
	use "lervag/vimtex"

	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)
