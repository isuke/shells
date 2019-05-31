#
# Path
#
export PATH=$HOME/bin:/usr/local/bin:$PATH

#
# Commands
#
# history
alias h='history'
alias ha='history -E 1'

# touch
alias tch='touch'

# tar
alias tzip='tar zcvf'
alias tunzip='tar xvf'

# less
alias less='less -N -S -#4'

# ls
alias ls='gls -G'
alias ll='gls -l --time-style="+%Y-%m-%d %H:%M:%S"'
alias la='gls -lA --time-style="+%Y-%m-%d %H:%M:%S"'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# sed
alias sed='gsed'

# cd
alias p='cd ~/Projects'
alias move='(){ mkdir -p $1; cd $1 }'

# job
alias port='(){ lsof -i:$1 }'

# terminal-notifier
alias noti='(){ terminal-notifier -message $1 }'

#
# History
#
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000
setopt hist_ignore_dups     # 前と重複する行は記録しない
setopt hist_reduce_blanks   # 余分なスペースを削除してヒストリに保存する
setopt share_history        # 同時に起動したzshの間でヒストリを共有する

setopt HIST_FIND_NO_DUPS    # 履歴検索中、(連続してなくとも)重複を飛ばす
setopt HIST_IGNORE_ALL_DUPS # 履歴中の重複行をファイル記録前に無くす
# setopt HIST_IGNORE_SPACE    # 行頭がスペースのコマンドは記録しない
setopt HIST_NO_STORE        # histroyコマンドは記録しない

autoload history-search-end

zshaddhistory() {
  local line=${1%%$'\n'} # コマンドライン全体から改行を除去したもの
  local cmd=${line%% *}  # １つ目のコマンド

  [[ ${#line} -ge 3 ]]
}

#
# 補完
#
setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt auto_param_keys       # カッコの対応などを自動的に補完
setopt complete_in_word      # 語の途中でもカーソル位置で補完
setopt always_last_prompt    # カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt print_eight_bit       # 日本語ファイル名等8ビットを通す
setopt extended_glob         # 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
setopt globdots              # 明確なドットの指定なしで.から始まるファイルをマッチ

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

#
# Other
#
setopt nonomatch
