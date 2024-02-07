change_tab_title() {
  if which chtwt > /dev/null; then
    chtwt "%~"
  fi
}

change_tab_color() {
  if which tab-color > /dev/null; then
    local black="28 30 37"
    local red="241 118 121"
    local green="146 179 118"
    local yellow="255 203 101"
    local blue="102 152 203"
    local magenta="204 152 203"
    local cyan="102 203 203"
    local white="242 239 235"

    local current_path=`print -P "%~"`

    if [[ $current_path =~ "^~\/Projects" ]]; then
      eval "tab-color $cyan"
    elif [[ $current_path =~ "^~\/Dropbox" ]]; then
      eval "tab-color $blue"
    elif [[ $current_path =~ "^~\/Downloads" ]]; then
      eval "tab-color $magenta"
    elif  [[ $current_path =~ "^~" ]]; then
      eval "tab-color $green"
    elif  [[ $current_path == "/tmp" ]]; then
      eval "tab-color $black"
    else
      tab-color
    fi
  fi
}

change_droolscar_langs() {
  local current_path=`print -P "%~"`

  if [[ $current_path =~ "^~\/Projects" ]]; then
    DROOLSCAR_LANGS=(ruby node)
  else
    DROOLSCAR_LANGS=()
  fi
}

exec_git_status() {
  local git_add_regexp="^g(it)? +add"
  local git_add_current_regexp="^g(it)? +add +\."
  local git_add_all_regexp="^g(it)? +add +-A"

  if [[ $__EXEC_COMMAND__ =~ $git_add_regexp ]]; then
    if ! [[ $__EXEC_COMMAND__ =~ $git_add_current_regexp || $__EXEC_COMMAND__ =~ $git_add_all_regexp ]]; then
      git status
    fi
  fi
}

###

chpwd_actions() {
  change_tab_title
  change_tab_color
  change_droolscar_langs
}

pre_cmd_actions() {
  __EXEC_COMMAND__="$1"

  # no-op
}

post_cmd_actions() {
  exec_git_status
}

add-zsh-hook chpwd chpwd_actions
add-zsh-hook preexec pre_cmd_actions
add-zsh-hook precmd post_cmd_actions
