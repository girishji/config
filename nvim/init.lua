-- everything from https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ
-- https://github.com/LunarVim/Neovim-from-scratch
--
require "user.keymaps"
require "user.options"
require "user.treesitter"
require "user.plugins"
-- require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.autopairs"
require "user.comment"
-- require "user.gitsigns"
require "user.nvim-tree"
require "user.bufferline"
-- require "user.lualine"
require "user.toggleterm"
-- require "user.project"
-- require "user.impatient"
-- provides thin lines at indentation
require "user.indentline"
-- require "user.alpha"
require "user.whichkey"
-- require "user.autocommands"
require "user.openbrowser"
--
-- HELP --
-- double esc will get rid of popup window
--
-- whichkey.lua has leader mappings. hold leader <spc> key for a while and it pops up
--   all keybindings
--
-- C-w will lead to menu for split window and other window commands
--
--  shift-' will bring up all registers and the contents. <c-r>reg_name to insert contents.
--
-- to install lsp server do :LspInstallInfo and pick a server (choose i to pick and X to remove)
--
-- when lsp gives you error (red dot in front of line) then run 'gl' for line
--   diagnostics (see these keybindings in lsp/handlers.lua). 
--   similarly, 'gd' to go to function definition, 'gD' for declaration, etc.
--   'K' after mouse is one some keyword will open doc in a popup window (say
--   on a funtion call). 'gr' will bring up a quickfix list.
--
-- :telescope lsp_references on a variable will bring up its definition through lsp.
--   telescope.lua has more keybindings
--   <leader>f is for find_files
--   <leader>g is for live grep, where you can grep a string inside project
--   when popup appears press esc and i go toggle b/w normal and insert mode.
--   https://github.com/nvim-telescope/telescope.nvim
--   <C-q>	Send all items not filtered to quickfixlist (qflist)
-- <M-q>	Send all selected items to qflist
-- H/M/L	Select High/Middle/Low (in normal mode)
-- 'gg/G'	Select the first/last item (in normal mode)
-- <CR>	Confirm selection
-- <C-x>	Go to file selection as a split
-- <C-v>	Go to file selection as a vsplit
-- <C-t>	Go to a file in a new tab
-- <C-u>	Scroll up in preview window
-- <C-d>	Scroll down in preview window
-- ... more
-- How to retain previous search?
-- :Telescope resume resumes the last picker and :Telescope pickers is a picker
-- over cached pickers. By default, IIRC the last picker is cached.
-- For more info, please see :h telescope.defaults.cache_picker
--
--   comment: 
--   use gc (and gcc) etc (https://github.com/numToStr/Comment.nvim)
--
-- toggleterm
--   ctrl-\  // to toggle on and off
--
-- lsp
-- keymappings see `:help vim.lsp.*` and `:help vim.diagnostic.*`
--
-- nvim-tree
-- does not change cwd (:pwd) of buffers from where this is opened; use :cd
--   but you can open files from inside the side window
-- to print cwd do :lua print(vim.fn.getcwd())
-- <CR> or o on the root folder will cd in the above directory
-- <C-]> will cd in the directory under the cursorline
-- type - to navigate up to the parent directory of the current file/directory
-- W will collapse the whole tree
-- H will toggle visibility of dotfiles
-- type a to add a file. Adding a directory requires leaving a leading / at the end of the path.
-- type r to rename a file
-- type d to delete a file (will prompt for confirmation)
-- type D to trash a file (configured in setup())
--
-- more here https://github.com/kyazdani42/nvim-tree.lua
--
-- open browser and search c++ definitions for word under cursor
-- type <leader>oc
--
-- :only (<c-w>o will close all other split windows)
--   :tabonly will close all other tabs except this one
--
-- to debug https://github.com/tjdevries/vlog.nvim
--   messages are stored in :messages
--
