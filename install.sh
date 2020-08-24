#!/bin/zsh
repo_root=https://raw.githubusercontent.com/jrowlingson/ember-brew/master/

# install ember-bench command
sudo curl -o /usr/local/bin/ember-bench ${repo_root}ember-bench

# install ember-bench lib
sudo mkdir -p /usr/local/lib/ember-bench/
sudo curl -o /usr/local/lib/ember-bench/bench.zsh ${repo_root}lib/bench.zsh
sudo curl -o /usr/local/lib/ember-bench/print_env.zsh ${repo_root}lib/print_env.zsh
