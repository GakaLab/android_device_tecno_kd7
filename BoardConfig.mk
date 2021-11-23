#
# Copyright (C) 2021 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH						:= device/tecno/kd7
BOARD_VENDOR						:= tecno

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE				:= true
TARGET_FLATTEN_APEX := false

# Assert
TARGET_OTA_ASSERT_DEVICE				:= kd7,TECNO-KD7

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES				:= true

# Architecture
TARGET_ARCH						:= arm64
TARGET_ARCH_VARIANT					:= armv8-a
TARGET_CPU_ABI						:= arm64-v8a
TARGET_CPU_ABI2						:=
TARGET_CPU_VARIANT					:= generic
TARGET_CPU_VARIANT_RUNTIME				:= cortex-a53

TARGET_2ND_ARCH						:= arm
TARGET_2ND_ARCH_VARIANT					:= armv7-a-neon
TARGET_2ND_CPU_ABI					:= armeabi-v7a
TARGET_2ND_CPU_ABI2					:= armeabi
TARGET_2ND_CPU_VARIANT					:= generic
TARGET_2ND_CPU_VARIANT_RUNTIME				:= cortex-a15

# Kernel
BOARD_KERNEL_BASE					:= 0x40000000
BOARD_KERNEL_OFFSET					:= 0x00080000
BOARD_RAMDISK_OFFSET					:= 0x11B00000
BOARD_RAMDISK_SECOND_OFFSET				:= 0x00f78000
BOARD_TAGS_OFFSET					:= 0x07880000
BOARD_DTB_OFFSET					:= 0x01f78000
TARGET_BOOTLOADER_BOARD_NAME				:= CY-KD7-H6211-F
BOARD_KERNEL_CMDLINE					:= bootopt=64S3,32N2,64N2
BOARD_KERNEL_PAGESIZE 					:= 2048
BOARD_KERNEL_IMAGE_NAME					:= Image.gz
TARGET_KERNEL_ARCH					:= arm64
TARGET_KERNEL_CONFIG					:= kd7_defconfig
TARGET_KERNEL_SOURCE					:= kernel/tecno/kd7
TARGET_PREBUILT_DTB					:= $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_BOOTIMG_HEADER_VERSION				:= 2
BOARD_INCLUDE_RECOVERY_DTBO				:= true
BOARD_PREBUILT_DTBOIMAGE				:= $(DEVICE_PATH)/prebuilt/dtbo.img
TARGET_PREBUILT_KERNEL					:= $(DEVICE_PATH)/prebuilt/kernel
NEEDS_KERNEL_COPY					:= true
HAS_PREBUILT_KERNEL					:= true
#TARGET_BOARD_KERNEL_HEADERS				:= $(DEVICE_PATH)/kernel-headers
TARGET_KERNEL_CLANG_COMPILE				:= false
TARGET_FORCE_PREBUILT_KERNEL				:= true
#COMMON_GLOBAL_CFLAGS					+= -std=gnu11
#ifeq ($(HAS_PREBUILT_KERNEL),true)
#TARGET_PREBUILT_KERNEL					:= $(DEVICE_PATH)/prebuilt/Image.gz
#NEEDS_KERNEL_COPY					:= true
#else
#TARGET_BOARD_KERNEL_HEADERS				+= \
#	$(LOCAL_PATH)/kernel-headers \
#	device/mediatek/common/kernel-headers
#			
#ifeq ($(TARGET_PREBUILT_KERNEL),)
#TARGET_KERNEL_CLANG_COMPILE				:= true
#endif

BOARD_MKBOOTIMG_ARGS					:= \
	--header_version $(BOARD_BOOTIMG_HEADER_VERSION) \
	--dtb_offset $(BOARD_DTB_OFFSET) \
	--dtb $(TARGET_PREBUILT_DTB) \
	--kernel_offset $(BOARD_KERNEL_OFFSET) \
	--ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
	--second_offset $(BOARD_RAMDISK_SECOND_OFFSET) \
	--tags_offset $(BOARD_TAGS_OFFSET) \
	--board $(TARGET_BOOTLOADER_BOARD_NAME) \
	--cmdline $(BOARD_KERNEL_CMDLINE)


# Partition
BOARD_BOOTIMAGE_PARTITION_SIZE				:= 33554432
BOARD_FLASH_BLOCK_SIZE					:= 131072
BOARD_RECOVERYIMAGE_PARTITION_SIZE			:= 33554432 #40894464

# Dynamic Partition
BOARD_SUPER_PARTITION_SIZE				:= 4362076160
BOARD_SUPER_PARTITION_GROUPS				:= main
BOARD_MAIN_SIZE						:= 4362076160
BOARD_MAIN_PARTITION_LIST				:= system vendor

# File systems
BOARD_HAS_LARGE_FILESYSTEM				:= true
BOARD_SYSTEMIMAGE_PARTITION_TYPE			:= ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE			:= ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE			:= ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE			:= ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE			:= ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE			:= f2fs
TARGET_USERIMAGES_USE_F2FS				:= true
TARGET_COPY_OUT_VENDOR					:= vendor
TARGET_COPY_OUT_PRODUCT					:= product
TARGET_COPY_OUT_SYSTEM_EXT				:= system_ext

# Mediatek
BOARD_USES_MTK_HARDWARE					:= true
TARGET_BOARD_PLATFORM					:= mt6765

# Manifests
DEVICE_MANIFEST_FILE					:= $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE					:= $(DEVICE_PATH)/compatibility_matrix.xml

# Crypto
TW_INCLUDE_CRYPTO					:= true
TW_INCLUDE_CRYPTO_FBE					:= true

# System as root
BOARD_SUPPRESS_SECURE_ERASE				:= true

# Metadata
BOARD_USES_METADATA_PARTITION				:= true

# AVB
BOARD_AVB_ENABLE					:= true
BOARD_AVB_RECOVERY_ALGORITHM				:= SHA512_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH				:= $(DEVICE_PATH)/configs/rsa_key_4096bits.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX			:= 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION		:= 1
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS			+= --flags 2

BOARD_USES_RECOVERY_AS_BOOT				:= false
# Recovery
TARGET_NO_RECOVERY					:= false
TARGET_RECOVERY_PIXEL_FORMAT				:= RGBX_8888

# Display
TARGET_SCREEN_HEIGHT					:= 1600
TARGET_SCREEN_WIDTH					:= 720
DEVICE_RESOLUTION					:= $(TARGET_SCREEN_WIDTH)x$(TARGET_SCREEN_HEIGHT)

# TWRP Configuration
BOARD_CHARGER_DISABLE_INIT_BLANK			:= true
RECOVERY_SDCARD_ON_DATA					:= true
TARGET_USES_MKE2FS					:= true
TW_BRIGHTNESS_PATH := "/sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness"
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone1/temp"
TW_DEFAULT_BRIGHTNESS					:= 1200
TW_EXCLUDE_DEFAULT_USB_INIT				:= true
TW_EXTRA_LANGUAGES					:= true
TW_INCLUDE_NTFS_3G					:= true
TW_MAX_BRIGHTNESS					:= 2047
TW_SCREEN_BLANK_ON_BOOT					:= true
TW_CUSTOM_THEME						:= portrait_hdpi
TW_USE_TOOLBOX						:= true

# Exclude
TW_EXCLUDE_TWRPAPP					:= true

# Debug
TWRP_INCLUDE_LOGCAT					:= true
TARGET_USES_LOGD					:= true
