#!/usr/bin/env bash
#
# Copyright © 2020-2021 Nemesis Team
#

rm -rf device/motorola
rm -rf vendor/motorola
rm -rf kernel/motorola
rm -rf hardware/motorola
rm -rf system/qcom

git clone https://github.com/Infinity-X-Devices/android_device_motorola_dubai.git -b 14-gapps device/motorola/dubai
git clone https://github.com/Infinity-X-Devices/android_device_motorola_sm7325-common.git -b 14 device/motorola/sm7325-common
git clone https://github.com/Infinity-X-Devices/android_kernel_motorola_sm7325.git -b 14 kernel/motorola/sm7325

git clone https://github.com/Infinity-X-Devices/android_vendor_motorola_dubai.git -b 14 vendor/motorola/dubai
git clone https://github.com/Infinity-X-Devices/android_vendor_motorola_sm7325-common.git -b 14 vendor/motorola/sm7325-common

git clone https://github.com/LineageOS/android_hardware_motorola.git -b lineage-21 hardware/motorola
git clone https://github.com/LineageOS/android_system_qcom.git -b lineage-21 system/qcom

repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
. build/envsetup.sh
lunch infinity_dubai-userdebug
mka bacon -j$(nproc --all)
