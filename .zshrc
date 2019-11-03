alias k='kubectl'

# path to workspace folder
export workspace="$HOME/lab/MASTER/workspace"
# path to meeting reports folder
export meeting="$HOME/lab/MASTER/meeting"

# promptの設定をしようとしたけどできない...
#PROMPT="%F{red}%m%f:%F{cyan}%~%f %F{white}[%*]%f
#%F{yellow}%c%f:%% "


# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
export ZSH_THEME="garyblessington"  # "mrtazz"
#export ZSH_THEME="wedisagree"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vagrant bundler ruby gem rails themes)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# 参考ページ　http://www.task-notes.com/entry/20141223/1419324649
# "config" scripts exist outside your system or Homebrew directories. `./configure` scripts often look for *-config scripts to determine if software packages are installed,
# and what additional flags to use when compiling and linking.
# brew doctorででたwarningを削除するためにaliasを作成
#echo 'alias brew="env PATH=${PATH/\/Users\/yutaro\/\.pyenv\/shims:/} brew"' >> .zshrc
alias brew="env PATH=${PATH/\/Users\/yutaro\/\.pyenv\/shims:/} brew"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# virtualenv
eval "$(pyenv virtualenv-init -)"

# node.jsインストール時の実行パスを通すため
export PATH=$PATH:/Users/yutaro/.nodebrew/current/bin

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

# homebrew caskのapplicationインストール先を
# /opt/homebrew-cask/Caskroom/　から　/Applicationsに変更
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function peco-find() {
  local current_buffer=$BUFFER
  local search_root=""
  local file_path=""

  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    search_root=`git rev-parse --show-toplevel`
  else
    search_root=`pwd`
  fi
  file_path="$(find ${search_root} -maxdepth 5 | peco)"
  BUFFER="${current_buffer} ${file_path}"
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-find
bindkey '^f' peco-find

# 文字コードの指定
#export LANG=ja_JP.UTF-8
#export LC_CTYPE=ja_JP.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# LaTeX
export PATH="/Library/TeX/texbin:$PATH"
export PATH="/sbin:$PATH"

# 自分で作ったshellscriptようにPATHを通す。
# 参考：http://joyplot.com/documents/2016/08/01/シェルスクリプトの保存場所を決める/
export PATH=$PATH:${HOME}/myshellscript/

# r言語のrコマンドを実行できるようにzsh defaultのrコマンドをdisableにする
disable r

#theme "wedisagree"のgit statusのクイック・リファレンス
#https://qiita.com/maangie/items/2ac2e26a39a0d2d9cc79
#function ph() {
#  local prompt_descriptions
#  prompt_descriptions=(
#    $ZSH_THEME_GIT_PROMPT_DIRTY 'dirty\tclean でない'
#    $ZSH_THEME_GIT_PROMPT_UNTRACKED 'untracked\tトラックされていないファイルがある'
#    $ZSH_THEME_GIT_PROMPT_CLEAN 'clean'
#    $ZSH_THEME_GIT_PROMPT_ADDED 'added\t追加されたファイルがある'
#    $ZSH_THEME_GIT_PROMPT_MODIFIED 'modified\t変更されたファイルがある'
#    $ZSH_THEME_GIT_PROMPT_DELETED 'deleted\t削除されたファイルがある'
#    $ZSH_THEME_GIT_PROMPT_RENAMED 'renamed\tファイル名が変更されたファイルがある'
#    $ZSH_THEME_GIT_PROMPT_UNMERGED 'unmerged\tマージされていないファイルがある'
#    $ZSH_THEME_GIT_PROMPT_AHEAD 'ahead\tmaster リポジトリよりコミットが進んでいる'
#  )
#
#  local i
#  for ((i = 1; i <= $#prompt_descriptions; i += 2))
#  do
#    local p=$prompt_descriptions[$i]
#    local d=$prompt_descriptions[$i+1]
#    echo `echo $p | sed -E 's/%.| //g'` $reset_color $d
#  done
#}

# for hyper -----------
# タブタイトルに動的に反映させる．
# ref: 
# https://qiita.com/vimyum/items/44478a51ef3a6f49804f
# https://qiita.com/shidash/items/ca60307a1341086b6e44
# Override auto-title when static titles are desired ($ title My new title)

# title() { export TITLE_OVERRIDDEN=1; echo -en "\e]0;$*\a"}
# # Turn off static titles ($ autotitle)
# autotitle() { export TITLE_OVERRIDDEN=0 }; autotitle
# # Condition checking if title is overridden
# overridden() { [[ $TITLE_OVERRIDDEN == 1 ]]; }
# # Echo asterisk if git state is dirty
# gitDirty() { [[ $(git status 2> /dev/null | grep -o '\w\+' | tail -n1) != ("clean"|"") ]] && echo "*" }
# # Show cwd when shell prompts for input.
# precmd() {
#    if overridden; then return; fi
#    cwd=${$(pwd)##*/} # Extract current working dir only
#    print -Pn "\e]0;$cwd$(gitDirty)\a" # Replace with $pwd to show full path
# }
# 
# # Prepend command (w/o arguments) to cwd while waiting for command to complete.
# preexec() {
#    if overridden; then return; fi
#    printf "\033]0;%s\a" "${1%% *} | $cwd$(gitDirty)" # Omit construct from $1 to show args
# }

precmd() {
   pwd=$(pwd)
   cwd=${pwd##*/}
   print -Pn "\e]0;$cwd\a"
}

preexec() {
   printf "\033]0;%s\a" "${1%% *} | $cwd"
}

# --------------

# for tmux
# ログインshellのzshを起動したときのみtmuxを起動しnew sessionを作るか既存のsessionにattachするか選択できる．
# ref: https://qiita.com/ssh0/items/a9956a74bff8254a606a
#if [[ ! -n $TMUX && $- == *l* ]]; then
#  # get the IDs
#  ID="`tmux list-sessions`"
#  if [[ -z "$ID" ]]; then
#    tmux new-session
#  fi
#  create_new_session="Create New Session"
#  ID="$ID\n${create_new_session}:"
#  ID="`echo $ID | $PERCOL | cut -d: -f1`"
#  if [[ "$ID" = "${create_new_session}" ]]; then
#    tmux new-session
#  elif [[ -n "$ID" ]]; then
#    tmux attach-session -t "$ID"
#  else
#    :  # Start terminal normally
#  fi
#fi

# for tmux setting to show currently branch
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# for source highlight
# http://nippondanji.blogspot.com/2011/11/less.html
export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh  %s'
