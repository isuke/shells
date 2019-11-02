case $OSTYPE in
  darwin*)
    if which chtwt > /dev/null; then
      precmd () { chtwt "%~" }
    fi
    ;;
  linux*)
    precmd () {}
    ;;
esac
