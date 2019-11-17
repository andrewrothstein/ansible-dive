#!/usr/bin/env sh
#set -x
DIR=~/Downloads
MIRROR=https://github.com/wagoodman/dive/releases/download

dl()
{
    local ver=$1
    local lchecksums=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-tar.gz}
    local platform="${os}_${arch}"
    local file=dive_${ver}_${platform}.${archive_type}
    local url=$MIRROR/v$ver/$file
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `fgrep $file $lchecksums | awk '{print $1}'`
}

dl_ver()
{
    local ver=$1
    local checksums=dive_${ver}_checksums.txt
    local lchecksums=$DIR/$checksums
    local rchecksums=$MIRROR/v$ver/$checksums
    if [ ! -e $lchecksums ];
    then
        wget -q -O $lchecksums $rchecksums
    fi

    printf "  # %s\n" $rchecksums
    printf "  '%s':\n" $ver

    dl $ver $lchecksums windows amd64 zip
    dl $ver $lchecksums darwin amd64
    dl $ver $lchecksums linux amd64
}

dl_ver ${1:-0.9.1}
