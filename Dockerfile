FROM alpine:3.17
ARG WORKDIR="toolbox"
ARG BUILD_SH="./build/targets/build_nmap.sh"
ARG ARCH="x86_64"

#WORKDIR .

COPY . ${WORKDIR}

RUN ${WORKDIR}/build/01_init.sh
#&& ${WORKDIR}/build/02_install_build_compiler.sh ${ARCH} \
#&& GITHUB_WORKSPACE=/${WORKDIR} /${WORKDIR}/build/targets/build_nmap.sh ${ARCH}


ENTRYPOINT ["/toolbox/run.sh"]
CMD ["x86_64"]
