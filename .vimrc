" Good example of .vimrc
" https://github.com/flatusv/dotfiles/blob/master/.vimrc

" Configuration file for vim
set modelines=0 " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible " Use Vim defaults instead of 100% vi compatibility
set backspace=2 " more powerful backspacing

" Line number Setting
" set relativenumber
set number

" Tab / Space Setting
set tabstop=2
set shiftwidth=2
set softtabstop=2
" Use spaces instead of tab
set expandtab
" Same indent as before line when new line
set autoindent
" Auto indent when new line
set smarttab

" Enable clipboard
" set clipboard+=unnamed

" Delete EOS spaces when saving
autocmd BufWritePre * :%s/\s\+$//ge

" Stop at _
" set iskeyword-=_ " if enable, syntax highlight is broken
set iskeyword-=$

" set 「」, （）as delimiter for Japanese
set matchpairs+=「:」,（:）

" To avoid annoying O delay
" https://superuser.com/questions/161178/why-does-vim-delay-for-a-second-whenever-i-use-the-o-command-open-a-new-line
set ttimeoutlen=100
" set timeoutlen=1000

" newline format
set fileformat=unix

" Turn on the WiLd menu //"set wildmenu" enables a menu at the bottom of the vim/gvim window.
set wildmenu

" about character code
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別.左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される

" About serch
set hlsearch
set smartcase
set ignorecase


" -- Change indent width based on file extension Start -----
" ref: https://qiita.com/mitsuru793/items/2d464f30bd091f5d0fef
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

" Enable markdown highlight
set syntax=markdown
au BufRead,BufNewFile,BufFilePre *.md set filetype=markdown

" Enable svelte highlight as html
au BufRead,BufNewFile,BufFilePre *.svelte set filetype=html
" -- Change indent width based on file extension End -------


" -- Color Setting Start ---------------------------------
" color list: https://h2plus.biz/hiromitsu/entry/674

" ref: https://qiita.com/pepoipod/items/e058b098af389ddb451f
" Same vim background as termianl
" autocmd ColorScheme * highlight Normal ctermbg=none
" autocmd ColorScheme * highlight LineNr ctermbg=none

" change statusline color
" autocmd ColorScheme * highlight StatusLine ctermbg=101 ctermfg=15 guibg=#87875f guifg=#262626 cterm=NONE gui=NONE
" autocmd ColorScheme * highlight StatusLine ctermbg=101 ctermfg=0 guibg=#87875f guifg=#262626 cterm=NONE gui=NONE
" colorscheme
" colorscheme apprentice
colorscheme jellybeans
set t_Co=256
syntax enable
" Visual mode color
hi Visual term=reverse cterm=reverse guibg=black
" Line number settings (color etc)
" set cursorline
" hi CursorLineNr term=bold cterm=NONE ctermfg=228 ctermbg=NONE
" hi clear CursorLine

" Tab edit color setting
" whole tab row color except tab
hi TabLineFill term=none cterm=none ctermfg=0 ctermbg=0
" non open tab color
hi TabLine term=none cterm=none ctermfg=240 ctermbg=none
" open tab color
hi TabLineSel term=bold cterm=bold ctermfg=255 ctermbg=none

" 背景色をなくす
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
" -- Color Setting End -----------------------------------


" -- StatusLine Format Setting Start --------------------
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
set statusline+=\ \ \ \ [ENC=%{&fileencoding}]　
" Always display statusline
set laststatus=2
" -- StatusLine Format Setting End ----------------------


" -- Settings for Japanese Start ------------------------
" □や○文字が崩れる問題を解決
set ambiwidth=double
" High light Zenkaku
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-color#color-zenkaku
function! ZenkakuSpace()
  highlight ZenkakuSpace ctermbg=203
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    autocmd VimEnter,WinEnter * match ZenkakuSpace '\%u3000'
  augroup END
  call ZenkakuSpace()
endif
" -- Settings for Japanese End --------------------------


" set black command to format python program
nnoremap <localleader>f :!isort --profile=black<space>%&black --line-length=120<space>%<cr>
set autoread
