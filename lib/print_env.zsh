function print_env() {
  print ""
  print "git repo: `basename $(git rev-parse --show-toplevel HEAD)`"
  print "git branch: `git rev-parse --abbrev-ref HEAD`"
  print "git commit: `git rev-parse --short HEAD`"
  ember -v | grep "cli\|os\|node"
  if [[ "$(uname)" == "Darwin" ]]; then
    print "cpu: `sysctl -a | grep machdep.cpu.brand_string  | cut -d':' -f2`"
    print "cpu cores: `sysctl -a | grep machdep.cpu.core_count  | cut -d':' -f2`"
    print "cpu threads: `sysctl -a | grep machdep.cpu.thread_count  | cut -d':' -f2`"
    print "mem: `sysctl -a | grep hw.memsize | sed 's/^.*\://' | xargs -Iz echo "z / 1000" | bc`kB"
  else
    print "cpu: `grep 'model name' /proc/cpuinfo | uniq | cut -d':' -f2 | sed 's/^ //g'`"
    print "cpu cores: `grep 'cpu cores' /proc/cpuinfo | uniq | cut -d':' -f2 | sed 's/ //g'`"
    print "cpu threads: `grep -c ^processor /proc/cpuinfo`"
    print "mem: `grep 'MemTotal' /proc/meminfo | uniq | cut -d':' -f2 | sed 's/ //g'`"
  fi
}

