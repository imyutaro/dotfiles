# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)
# plugins=(git history-substring-search)

export TERM=xterm-256color

# Char code
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

PROMPT='%F{226}%n%f$(git_prompt_info)%F{1} »%f '
RPROMPT='%F{26}%4~%f'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"

# For openjdk. I installed openjdk for DBeaver.
# ref : https://qiita.com/gishi_yama/items/ee3526e7e7a922148333
# export JAVA_HOME=`/usr/libexec/java_home -v 13`
# export JAVA_HOME=`/usr/libexec/java_home -v 14` # もともとこっちだった
export JAVA_HOME=`/usr/libexec/java_home -v 15`
export PATH="$JAVA_HOME/bin:$PATH"

# viins keymap
# bindkey -v
# bindkey "^?" backward-delete-char

# History autocomplete
# bindkey '\e[A' history-beginning-search-backward
# bindkey '\e[B' history-beginning-search-forward
# bindkey '\e[A' history-search-backward
# bindkey '\e[B' history-search-forward

# Settings for ssh-agent
SSH_AGENT_FILE="$HOME/.ssh/ssh_agent"

# 固定化された ssh-agent 設定が存在すれば、それを読み込んで
# 既に起動している ssh-agent プロセスを再利用
[ -f $SSH_AGENT_FILE ] && source $SSH_AGENT_FILE >& /dev/null

# ssh-add がエラーを返すなら、ssh-agent プロセスが存在しないものとして
# これを起動しつつ、設定をファイルに出力
if ! ssh-add -l >& /dev/null ; then
    ssh-agent > $SSH_AGENT_FILE
    # ssh-agent の設定内容を標準出力してほしいなら、/dev/null へ投げなくても良い
    source $SSH_AGENT_FILE >& /dev/null
    # $HOME/.ssh 配下にある id_rsa という名前のファイルを ssh-add
    find $HOME/.ssh -name bp | xargs ssh-add
fi

# 自分のシェルスクリプトのパスを通す
export PATH=$HOME/local/bin:$PATH

# For brew doctor warning
export PATH="/usr/local/sbin:$PATH"

# vim keybind in cli
bindkey -v
bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^E'  end-of-line

# ==========================

# completions
autoload -Uz compinit

zmodload zsh/zprof

