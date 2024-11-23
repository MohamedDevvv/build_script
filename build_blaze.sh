#!/bin/bash

#removals
rm -rf .repo/local_manifests
#sync
repo init --depth=1 -u https://github.com/ProjectBlaze/manifest -b 14
git clone https://github.com/MohamedDevvv/Build- -b main .repo/local_manifests
if [ -f /opt/crave/resync.sh ]; then
  /opt/crave/resync.sh
else
  repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
fi

#build
. build/envsetup.sh
lunch blaze_gale-ap2a-userdebug
mka installclean
mka bacon
