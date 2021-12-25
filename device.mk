#
# Copyright (C) 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#$(call inherit-product, device/generic/common/gsi_arm64.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/media_system_ext.mk)

# APEX
TARGET_FLATTEN_APEX					:= false
PRODUCT_INSTALL_EXTRA_FLATTENED_APEXES			:= true

# Bluetooth
PRODUCT_PACKAGES					+= \
    audio.a2dp.default

# Boot animation
TARGET_SCREEN_HEIGHT					:= 1600
TARGET_SCREEN_WIDTH					:= 720

# Camera
PRODUCT_PACKAGES					+= \
    Snap

# Dynamic Partition
PRODUCT_USE_DYNAMIC_PARTITIONS				:= true
PRODUCT_USE_DYNAMIC_PARTITION_SIZE			:= true
PRODUCT_PACKAGES					+= \
    com.android.apex.cts.shim.v1_with_prebuilts.flattened

# Fastbootd
PRODUCT_PACKAGES					+= \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Init
PRODUCT_COPY_FILES					+= \
    $(LOCAL_PATH)/fstab.mt6765:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6765
PRODUCT_PACKAGES					+= \
    fstab.enableswap \
    init.target.rc

# Input
PRODUCT_COPY_FILES					+= \
    $(LOCAL_PATH)/keylayout/ACCDET.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/ACCDET.kl \
    $(LOCAL_PATH)/keylayout/mtk-kpd.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/mtk-kpd.kl


# KPOC
PRODUCT_PACKAGES					+= \
    libsuspend

# GMS
PRODUCT_GMS_CLIENTID_BASE				:= android-tecno

# GSI
BUILDING_GSI						:= true
PRODUCT_BUILD_CACHE_IMAGE				:= false
PRODUCT_BUILD_USERDATA_IMAGE				:= false
PRODUCT_BUILD_VENDOR_IMAGE				:= false
PRODUCT_BUILD_SUPER_PARTITION				:= false
PRODUCT_BUILD_SUPER_EMPTY_IMAGE				:= false
PRODUCT_PACKAGES					+= \
    gsi_skip_mount.cfg \
    init.gsi.rc \
    init.vndk-nodef.rc \
    q-developer-gsi.avbpubkey \
    r-developer-gsi.avbpubkey \
    s-developer-gsi.avbpubkey

#  handheld packages
PRODUCT_PACKAGES					+= \
    Launcher3QuickStep \
    Provision \
    Settings \
    StorageManager \
    SystemUI

# IMS
PRODUCT_PACKAGES					+= \
    mtk-ims \
    mtk-ims-telephony \
    ImsInit

# Optimisations
PRODUCT_SET_DEBUGFS_RESTRICTIONS			:= false
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE			:= true
PRODUCT_PROPERTY_OVERRIDES				+= \
    ro.apex.updatable=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES			+= \
    camera.disable_zsl_mode=1 \
    ro.logd.kernel=true \
    ro.oem_unlock_supported=1 \
    ro.sf.lcd_density=320 \
    ro.vendor.pnpmgr.support=1 \
    ro.vendor.rc=/vendor/etc/init/hw/ \
    ro.adb.secure=0
PRODUCT_SYSTEM_PROPERTIES				+= \
    persist.sys.isUsbOtgEnabled=true \
    ro.boot.dynamic_partitions=true \
    ro.mediatek.platform=MT6765 \
    ro.sys.usb.mtp.whql.enable=0 \
    ro.sys.usb.storage.type=mtp

# Overlays
DEVICE_PACKAGE_OVERLAYS					+= $(LOCAL_PATH)/overlay
ifneq ($(findstring lineage, $(TARGET_PRODUCT)),)
DEVICE_PACKAGE_OVERLAYS					+= $(LOCAL_PATH)/overlay-lineage
endif

# Permissions
PRODUCT_COPY_FILES					+= \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml

# Power
PRODUCT_PACKAGES					+= \
    power.mt6765

# RCS
PRODUCT_PACKAGES					+= \
    RcsService

# Screen density
PRODUCT_AAPT_CONFIG					:= normal
PRODUCT_AAPT_PREF_CONFIG				:= xhdpi

# Shims
PRODUCT_PACKAGES += \
    libshim_showlogo

# Soong namespaces
PRODUCT_SOONG_NAMESPACES				+= \
    $(LOCAL_PATH)

# Superuser
PRODUCT_PACKAGES					+= \
    su

# System properties
-include $(LOCAL_PATH)/product_prop.mk

#  telephony packages
PRODUCT_PACKAGES					+= \
    CarrierConfig

# Trust HAL
PRODUCT_PACKAGES					+= \
    lineage.trust@1.0-service

# VNDK packages
PRODUCT_EXTRA_VNDK_VERSIONS				:= 29

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST		+= \
    ramdisk/fstab.mt6765 \
    system/app/% \
    system/product/% \
    system/bin/% \
    system/etc/% \
    system/priv-app/% \
    system/framework/% \
    system/lib/% \
    system/lib64/% \
    system/usr/% \
    system/xbin/su

# Wi-Fi
PRODUCT_PACKAGES					+= \
    TetheringConfigOverlay \
    WifiOverlay

# Inherit proprietary parts
$(call inherit-product-if-exists, vendor/tecno/kd7/kd7-vendor.mk)
