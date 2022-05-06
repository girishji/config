-- everything from https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ

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
-- require "user.nvim-tree"
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
--   <c-t> is for live grep, where you can grep a string inside project
--   when popup appears press esc and i go toggle b/w normal and insert mode.
--
--   comment: 
--   use gc etc (https://github.com/numToStr/Comment.nvim)
--
-- toggleterm
--   ctrl-\  // to toggle on and off
--
