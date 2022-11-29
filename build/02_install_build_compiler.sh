#!/bin/bash
if [ $# -ne 1 ];then
    echo "Missing arch"
    exit 1
fi
ARCH="${1,,}"
case $ARCH in
    x86_64|i686|aarch64)
        ARCH="${ARCH}-linux-musl"
        ;;
    x86)
        ARCH="i686-linux-musl"
        ;;
    arm|armhf)
        ARCH="arm-linux-musleabihf"
        ;;
    *)
        echo "Invalid arch ${ARCH}"
        exit 1
        ;;
esac
HOST=http://musl.cc
cd /
curl -so ${ARCH}-cross.tgz ${HOST}/${ARCH}-cross.tgz
tar -xf ${ARCH}-cross.tgz 
for b in gcc g++ ar cc ranlib strip
do
    ln -s /${ARCH}-cross/bin/${ARCH}-${b} /usr/bin/${b}
done
rm ${ARCH}-cross.tgz