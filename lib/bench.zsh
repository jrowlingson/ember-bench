function bench() {
  time_cmd="/usr/bin/time"
  if [[ "$(uname)" == "Darwin" ]]; then
    time_cmd="/usr/local/bin/gtime"
  fi
  n=${3:-5}
  before_all=$4
  before_each=$5
  test_desc="\n$1: $2 (n=$n$info_label"
  if [[ $before_all != '' ]]; then
    test_desc+=", before_all: $before_all"
  fi
  if [[ $before_each != '' ]]; then
    test_desc+=", before_each: $before_each"
  fi
  test_desc+=')'
  print $test_desc
  eval $before_all &> /dev/null
  print "\n\treal\tuser\tsys"
  print "\t⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻"
  for i in `seq 1 $n`;
    do
      eval $before_each &> /dev/null
      cmd="$time_cmd -f '%e,%U,%S' -o ember-bench.tmp $2 &> /dev/null"
      eval $cmd
      elapsed=$(cat ember-bench.tmp)
      rm ember-bench.tmp
      IFS=, read -rA arr <<< "$elapsed"
      print "\t$arr[1]\t$arr[2]\t$arr[3]"
      real_acc+=$arr[1]
      user_acc+=$arr[2]
      sys_acc+=$arr[3]
      if [[ $i -ne $n ]]; then
        real_acc+="+"
        user_acc+="+"
        sys_acc+="+"
      fi
  done
  print "\t⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻⎻"
  real_avg=`echo "scale=2; (${real_acc})/$n" | bc -l`; real_acc=''
  user_avg=`echo "scale=2; (${user_acc})/$n" | bc -l`; user_acc=''
  sys_avg=`echo "scale=2; (${sys_acc})/$n" | bc -l`; sys_acc=''
  print "\t$real_avg\t$user_avg\t$sys_avg"
}
