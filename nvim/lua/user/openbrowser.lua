-- https://idie.ru/posts/vim-modern-cpp#browsing-online-documentation-from-vim
-- open browser and search c++ definitions for word under cursor
vim.cmd [[
  let g:openbrowser_search_engines = extend(
  \ get(g:, 'openbrowser_search_engines', {}),
  \ {
  \   'cppreference': 'https://en.cppreference.com/mwiki/index.php?title=Special%3ASearch&search={query}',
  \   'qt': 'https://doc.qt.io/qt-5/search-results.html?q={query}',
  \ },
  \ 'keep'
  \)

  nnoremap <silent> <leader>oc :call openbrowser#smart_search(expand('<cword>'), "cppreference")<CR>
  " nnoremap <silent> <leader>oq :call openbrowser#smart_search(expand('<cword>'), "qt")<CR>
]]
