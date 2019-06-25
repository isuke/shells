#
# PATH
#
if [ ! -f /usr/local/bin/node ]; then ln -s ${HOME}.anyenv/envs/ndenv/shims/node /usr/local/bin/node; fi
if [ ! -f /usr/local/bin/npm ];  then ln -s ${HOME}.anyenv/envs/ndenv/shims/npm  /usr/local/bin/npm; fi

#
# yarn
#
if which yarn > /dev/null; then
  if [ ! -d ${HOME}/.yarn ]; then ${HOME}/.yarn; fi

  yarn config set prefix ${HOME}/.yarn > /dev/null
  export PATH="$PATH:`yarn global bin`"
fi
