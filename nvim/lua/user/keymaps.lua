local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize split windows with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers (including bufferline plugin)
-- comment out below since you can use C-^ and telescope (space-b),
-- and want H and L for viewport navigation
-- to toggle between two buffers use C-^ (ctrl-6)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Visual --
-- Stay in visual mode when indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Search for visually selected text using //
vim.cmd [[
  vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
]]

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
-- keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- get rid of preview window when showing file list
-- keymap("n", "<leader>f",
--   "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)

-- toggle relative line num
keymap("n", "<C-n>", ":set rnu!", opts)

-- save file and quit
-- following 3 are also redefined in whichkey.lua (using leader key)
-- keymap("n", "<C-s>", ":w<CR>", opts)
-- keymap("i", "<C-s>", "<Esc>:w<CR>i", opts)
-- keymap("n", "<c-q>", ":q<cr>", opts)

-- misc
-- make gm move to center of line
keymap("n", "gm", "gM", opts)
keymap("v", "gm", "gM", opts)
-- gp to selct visually last pasted text
-- keymap("n", "gp", "`[v`]", opts)

-- following mapping to: 
--    reselect last modified chunk (including pasted)
--    g/ to search visually selected text
--    qq to surround visual selection with single quote
vim.cmd [[
  nnoremap <expr> gp '`[' . getregtype()[0] . '`]'
  vnoremap g/ y/<C-R>"<CR>
  vnoremap qq <Esc>`>a'<Esc>`<i'<Esc>
]]


-- visually select range of python code, execute it, insert results
-- (in all below cases vim inserts `<`> automatically)
-- in visual mode either type ':ExecPy' or ':call ExecutePythonCode()'
-- you can do ":w !python" to run selected code and disply result in 
--   the status window below
-- https://vim.fandom.com/wiki/Capture_ex_command_output
--
vim.api.nvim_exec([[
  function! ExecutePythonCode() range
    " redirect output to variable
    redir => message
    " https://stackoverflow.com/questions/8841465/vim-for-loop-trailing-characters-error
    " https://vi.stackexchange.com/questions/23063/leading-blank-line-with-execute-function
    exec a:firstline . "," . a:lastline . " :w !python3"
    redir END
    if empty(message)
      echoerr "no output"
    else
      normal! `>
      normal! o
      normal i------------------------
      " silent put=trim(message)
      for line in split(message, "\n")
        " check for empty line
        if match(line, "^\\s*$") == -1
          silent put = line
        endif
      endfor
      normal o
      normal i------------------------
      normal o
    endif
  endfuncti on
  command! -range ExecPy <line1>,<line2> call ExecutePythonCode()
  " command! -range EP `<,`> call ExecutePythonCode()
]], false)

