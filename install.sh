#!/bin/zsh
repo_root=https://raw.githubusercontent.com/jrowlingson/ember-brew/master

# install ember-bench command
sudo curl -o /usr/local/bin/ember-bench ${repo_root}ember-bench
sudo chmod 755 `whoami` /usr/local/bin/ember-bench

# install ember-bench lib
sudo mkdir /usr/local/lib/ember-bench/
sudo curl -o /usr/local/lib/ember-bench/bench.zsh ${repo_root}ember-brew/lib/bench.zsh
sudo curl -o /usr/local/lib/ember-bench/print_env.zsh ${repo_root}ember-brew/lib/print_env.zsh
