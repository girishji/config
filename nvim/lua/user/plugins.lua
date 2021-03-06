local fn = vim.fn

-- Automatically install packer
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
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("giri: packer load failed")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  -- XXX switch to main branch for bufferline
  use "akinsho/bufferline.nvim"
  -- use { "akinsho/bufferline.nvim", branch = "dev" }
  use "moll/vim-bbye"
  -- use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  -- use "ahmedkhalf/project.nvim"
  -- use "lewis6991/impatient.nvim"
  -- provides thin vertical lines at indentation
  use "lukas-reineke/indent-blankline.nvim"
  -- use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  -- use "lunarvim/darkplus.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"  -- lsp completions
  use "uga-rosa/cmp-dictionary" -- dictionary (user and sourced) completion
  
  use "first20hours/google-10000-english" -- most used words in english

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  -- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use "girishji/friendly-snippets" -- a bunch of snippets to use
  use "girishji/algorithm-mnemonics.nvim"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer (bootstraps lsps and gives you menu)
  -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  -- null-ls connects to nvim's lsp (acts as another language server) and injects diagnostics or
  --   provides formatting command (if designated language server does not do so), and more.
  --   see https://youtu.be/b7OguLuaYvE 
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  -- comment string for treesitter
  -- use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  -- use "lewis6991/gitsigns.nvim"

  -- open browser; search for word under cursor
  -- https://idie.ru/posts/vim-modern-cpp
  use "tyru/open-browser.vim"

  -- zk
  -- use "mickael-menu/zk-nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
