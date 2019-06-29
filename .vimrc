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
" 背景をterminalの背景に揃える
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

" colorscheme
"colorscheme molokai
"syntax on
colorscheme apprentice
set t_Co=256
syntax enable
" 行番号を表示
set number
" for indent
" tab=4spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
" タブの代わりに空白文字を指定する
set expandtab
" 新しい行のインデントを現在行と同じにする
set autoindent
" 新しい行を作ったときに高度な自動インデントを行う
set smarttab
" 行番号の設定　行の色など
set cursorline
hi CursorLineNr term=bold cterm=NONE ctermfg=228 ctermbg=NONE
hi clear CursorLine
" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" good example of .vimrc
" https://github.com/flatusv/dotfiles/blob/master/.vimrc

" Ignore case when searching
" set ignorecase

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
