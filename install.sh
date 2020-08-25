#!/bin/zsh
repo_root=https://raw.githubusercontent.com/jrowlingson/ember-bench/master/

# install ember-bench command
sudo curl -o /usr/local/bin/ember-bench ${repo_root}ember-bench
sudo chmod 755 /usr/local/bin/ember-bench

# install ember-bench lib
sudo mkdir -p /usr/local/lib/ember-bench/
sudo curl -o /usr/local/lib/ember-bench/bench.zsh ${repo_root}lib/bench.zsh
sudo curl -o /usr/local/lib/ember-bench/print_env.zsh ${repo_root}lib/print_env.zsh

# check deps
if [[ "$(uname)" == "Darwin" ]]; then
  if ! type "gtime" > /dev/null; then
    print 'gtime does not exist. installing via brew'
    if ! type "brew" > /dev/null; then
      print 'error: brew must be installed'
      exit 1
    fi
    brew install gnu-time
  fi
fi
