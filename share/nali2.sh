#!/bin/sh
DIR=$(dirname $0)
if test $# -gt 0
then
    echo $@|perl ${DIR}/../share/nali2.pl
else
    perl ${DIR}/../share/nali2.pl
fi
