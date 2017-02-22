#
# Path
#
export PATH=$HOME/bin:/usr/local/bin:$PATH

#
# Commands
#
# history
alias h='history'

# touch
alias t='touch'

# tar
alias tzip='tar zcvf'
alias tunzip='tar xvf'

# less
alias less='less -N -S -#4'

# ls
alias ll='ls -l'
alias la='ls -lA'

# sublime
alias sublime_package="~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User"

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
