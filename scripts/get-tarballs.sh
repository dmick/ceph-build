#!/bin/bash
# Helper to get orig.tar.gz and tar.gz for releases.
# Pulls from chacra to download.  Called from sync-pull and run with ssh.
# Run with "ssh signer@download.ceph.com /home/signer/bin/get-tarballs
# <release> <sha1> <versi0on>", as the call from sync-pull does.
# sync-pull will copy this to download.ceph.com:/home/signer/bin/get-tarballs.sh


: ${2?"Usage: $0 \$release \$sha1 \$version"}

release=$1
sha1=$2
version=$3

pushd /data/download.ceph.com/www/tarballs

if [ ! -f ceph_$version.orig.tar.gz ]; then
  wget https://chacra.ceph.com/binaries/ceph/$release/$sha1/ubuntu/focal/x86_64/flavors/default/ceph_$version.orig.tar.gz || wget https://chacra.ceph.com/binaries/ceph/$release/$sha1/ubuntu/jammy/x86_64/flavors/default/ceph_$version.orig.tar.gz
  wget https://chacra.ceph.com/binaries/ceph/$release/$sha1/ubuntu/focal/x86_64/flavors/default/ceph-$version.tar.gz || wget https://chacra.ceph.com/binaries/ceph/$release/$sha1/ubuntu/jammy/x86_64/flavors/default/ceph-$version.tar.gz
fi

popd

