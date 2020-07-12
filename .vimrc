" Configuration file for vim
set modelines=0 " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible " Use Vim defaults instead of 100% vi compatibility
set backspace=2 " more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" ref: https://qiita.com/pepoipod/items/e058b098af389ddb451f
" Same vim background as termianl
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

" change statusline color
" autocmd ColorScheme * highlight StatusLine ctermbg=101 ctermfg=15 guibg=#87875f guifg=#262626 cterm=NONE gui=NONE
autocmd ColorScheme * highlight StatusLine ctermbg=101 ctermfg=0 guibg=#87875f guifg=#262626 cterm=NONE gui=NONE
" colorscheme
colorscheme apprentice
set t_Co=256
syntax enable
" Line number
set number
" tab=4spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
" Use spaces instead of tab
set expandtab
" 新しい行のインデントを現在行と同じにする
set autoindent
" 新しい行を作ったときに高度な自動インデントを行う
set smarttab
" Line number settings (color etc)
set cursorline
hi CursorLineNr term=bold cterm=NONE ctermfg=228 ctermbg=NONE
hi clear CursorLine
" grep search
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" good example of .vimrc
" https://github.com/flatusv/dotfiles/blob/master/.vimrc

" Turn on the WiLd menu //"set wildmenu" enables a menu at the bottom of the vim/gvim window.
set wildmenu

" indentLine for indent guide
set list listchars=tab:\¦\
"let g:indentLine_color_gui = '#708090'
"set conceallevel=1
"let g:indentLine_conceallevel=1

"---------- from server

" about character code
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別.左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

" disable arrow key
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" About serch
set hlsearch
set smartcase
set ignorecase

" ===============================================================
" Change indent width based on file extension
" ref: https://qiita.com/mitsuru793/items/2d464f30bd091f5d0fef
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.c setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead * setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" status line
" Display HELP if HELP page
set statusline=%h
" Display file name
set statusline+=\ %t
" If file is changed, + is shown. If read only, display [-]
set statusline+=%m\ \<\<
" Display full path
set statusline+=\ %F
" Readonly or not
" set statusline+=%r
" Display PREVIEW if PREVIEW window
set statusline+=%w
" Right side fomr below
set statusline+=%=
" Column number
set statusline+=(%l:%c)
" % of file
set statusline+=\ -\ %P
" File encoding
set statusline+=\ \ \ \ [ENC=%{&fileencoding}]\ 
" Always display statusline
set laststatus=2


" " Color theme
" " these highlight etc settings about colorscheme have to be put before colorscheme molokai
" set t_Co=256
" autocmd ColorScheme * highlight Visual ctermbg=231 ctermfg=35 guibg=#262626 guifg=#8fafd7 cterm=reverse gui=reverse
" " autocmd ColorScheme * highlight Comment ctermfg=darkgray
" " set background=dark
" syntax on
" colorscheme molokai

set matchpairs+=「:」,（:）
set clipboard+=unnamed

