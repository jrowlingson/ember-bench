#!/bin/zsh

# color output
RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

print "${GREEN}installing ember-bench...${NOCOLOR}"

repo_root=https://raw.githubusercontent.com/jrowlingson/ember-bench/master/

# install ember-bench command
sudo curl -o /usr/local/bin/ember-bench ${repo_root}ember-bench
sudo chmod 755 /usr/local/bin/ember-bench

# install ember-bench lib
sudo mkdir -p /usr/local/lib/ember-bench/
sudo curl -o /usr/local/lib/ember-bench/bench.zsh ${repo_root}lib/bench.zsh
sudo curl -o /usr/local/lib/ember-bench/print_env.zsh ${repo_root}lib/print_env.zsh
sudo curl -o /usr/local/lib/ember-bench/handle_options.zsh ${repo_root}lib/handle_options.zsh

# check deps
if [[ "$(uname)" == "Darwin" ]]; then
  if ! type "gtime" > /dev/null; then
    print 'gtime does not exist. installing via brew'
    if ! type "brew" > /dev/null; then
      print "${RED}error: brew must be installed${NOCOLOR}"
      exit 1
    fi
    brew install gnu-time
  fi
fi

print "${GREEN}success! try running${NOCOLOR} ember-bench --version"
