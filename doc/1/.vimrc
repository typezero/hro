"version 6.0
set nocompatible
"if !&cp | set cp | endif
"set background=dark
" vim: set ft=vim :

autocmd FileType haskell nmap <C-c><C-f> :GhciFile<CR>

" use ghc functionality for haskell files
au BufEnter *.hs compiler ghc

colorscheme slate
set background=dark

syntax on

set hlsearch
set incsearch
set ignorecase

set autoindent
set smartindent

set tabstop=4
set shiftwidth=4

set expandtab

set wrap
set linebreak

set showcmd

function InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
  return "\<tab>"
  else
  return "\<c-p>"
  endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<cr>
set complete=""
" из буфера
set complete+=.
" из словаря
set complete+=k
" из разных буферов
set complete+=b
" из тегов
set complete+=t

" меняем директорию автоматом для текущего файла
autocmd BufEnter * lcd %:p:h

nmap <F5> :make<cr>
vmap <F5> <esc>:make<cr>
imap <F5> <esc>:make<cr>

nmap <F6> :copen<cr>
vmap <F6> <esc>:copen<cr>
imap <F6> <esc>:copen<cr>

nmap <F4> :Project<cr>
vmap <F4> <esc>:Project<cr>
imap <F4> <esc>:Project<cr>
