#!/usr/bin/env bash

set -o nounset
set -o errexit

#VIEW=gpalya_fos_mercury_infrdist_dev_01
VIEW=$1

CSCOPE=/users/home40/gpalya/bin/cscopedbcreate
ZEBOS=/vobs/projects/springboard/tps/ZebOS
FABOS=/vobs/projects/springboard/fabos
KERNEL=/vobs/projects/springboard/linux_plat/linux_2_6_30

/opt/rational/clearcase/bin/cleartool setview -login -exec "sleep 5; cd ${ZEBOS} && ${CSCOPE}; cd ${FABOS} && ${CSCOPE}; cd ${KERNEL} && ${CSCOPE}" $VIEW > /dev/null 2>&1
#/opt/rational/clearcase/bin/cleartool setview -login -exec "sleep 5; cd ${ZEBOS} && ${CSCOPE}; cd ${FABOS} && ${CSCOPE}; cd ${KERNEL} && ${CSCOPE}" $VIEW 
