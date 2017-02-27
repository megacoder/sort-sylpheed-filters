#!/bin/zsh

ME=$(readlink -e "${0}")
MYDIR=$(readlink -e $(dirname "${0}"))

cd ~/.sylpheed-2.0
set -e
xsltproc ${MYDIR}/sort-sylpheed-filters.xslt filter.xml "$@" >filter.xml.tmp
mv -f filter.xml filter.xml-keep
mv -f filter.xml.tmp filter.xml
