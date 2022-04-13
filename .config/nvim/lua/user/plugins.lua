local fn = vim.fn

local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth", 
		"1", 
		"https://github.com/wbthomason/packer.nvim", 
		install_path})
		print "Installing packer; close and reopen Neovim..."
		vim.cmd [[packadd packer.nvim]]
end

-- Auto sync Packer when saving this file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float {border = "rounded"}
		end,
	}
}

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "justinmk/vim-dirvish"
    use "iamcco/markdown-preview.nvim"
    use "psliwka/vim-smoothie"
    use "nvim-treesitter/nvim-treesitter"

    -- Color Schemes
    use "lunarvim/colorschemes"
    use "dracula/vim"
    use "morhetz/gruvbox"
    use "lifepillar/vim-gruvbox8"
    use "folke/tokyonight.nvim"

    -- Complete plugins
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"

	-- Snippets
	use "L3MON4D3/LuaSnip" 
	use "rafamadriz/friendly-snippets"

	-- LSP plugins
	use "neovim/nvim-lspconfig"
	use "williamboman/nvim-lsp-installer"

  use "liuchengxu/vista.vim"

	if packer_bootstrap then
		require("packer").sync()
	end
end)

