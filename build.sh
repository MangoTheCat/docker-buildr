#! /bin/bash

export R_LIBS=/home/docker/local_lib
export R_LIBS_USER=/home/docker/local_lib

echo "Installing Dependencies"
R -e "remotes::install_deps(\"pkg\", dependencies = TRUE, threads = parallel::detectCores())"

echo "Building the Package"
R CMD build pkg

tarfile=$(ls *.tar.gz)

echo "Running CMD check"
R CMD check $tarfile --no-manual

checkdir=$(ls -d *.Rcheck)

status=$(cat $checkdir/00check.log | grep "^Status")

echo $status

if grep -q "ERROR\|WARNING" <<< $status; then
  echo $status 1>&2
  echo "Check Failed" 1>&2
  exit 1
else
  exit 0
fi
