#!/usr/bin/env bash
BASE_DEBUG=${BASE_DEBUG:=0}
BASE_NOEXIT=${BASE_NOEXIT:=0}

test ${BASE_DEBUG} -ge 9 && set -x

run-parts --exit-on-error /etc/init.wrapper/pre-init.d || {
  echo 'Exitting due /etc/init.wrapper/pre-init.d failure'
  test ${BASE_NOEXIT} -eq 1 ||
    exit 1
}

test ${BASE_DEBUG} -ge 1 && {
  echo Available environment:
  env|sort
}

test ${BASE_DEBUG} -ge 1 && {
  echo Running: \"$@\"
}

test $# -lt 1 && {
  echo bash >> /etc/rc.local
}
test $# -eq 1 && {
  echo $* >> /etc/rc.local
}
test $# -ge 2 && {
  test "x$1" = "x/usr/bin/dumb-init" -a "x$2" = "x/etc/rc.local" && {
    echo Running dumb-init with rc.local
  } || {
    echo $* >> /etc/rc.local
  }
}

test ${BASE_DEBUG} -ge 2 && {
  cat /etc/rc.local
}

exec /usr/bin/dumb-init /etc/rc.local
