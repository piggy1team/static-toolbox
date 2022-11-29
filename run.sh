#!/bin/bash
if [ $# -ne 1 ];then
    echo "run.sh Missing arch"
    exit 1
fi
ARCH="${1,,}"
WORKDIR=/toolbox
${WORKDIR}/build/02_install_build_compiler.sh ${ARCH}
GITHUB_WORKSPACE=/${WORKDIR} /${WORKDIR}/build/targets/build_nmap.sh ${ARCH}
