#
# Copyright (C) 2018 The LineageOS Project
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

# Inherit from universal5420-common
include device/samsung/universal5420-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/ha3g

# Include path
TARGET_SPECIFIC_HEADER_PATH += $(DEVICE_PATH)/include

BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
BUILD_BROKEN_VINTF_PRODUCT_COPY_FILES := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true
BOARD_DO_NOT_STRIP_VENDOR_MODULES := true

# Display
TARGET_SCREEN_DENSITY := 480

# Assert
TARGET_OTA_ASSERT_DEVICE := ha3g

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Kernel
TARGET_KERNEL_CONFIG := lineageos_ha3g_defconfig

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE   := $(DEVICE_PATH)/compatibility_matrix.xml

# Legacy BLOB Support
TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/vendor/bin/hw/rild=27

# Network Routing
TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 11534336
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 13631488
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2398552064
# userdata = 27912056832 = (27912073216 - 16384 <encryption footer>)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27912056832
BOARD_CACHEIMAGE_PARTITION_SIZE := 309616640
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ROOT_EXTRA_SYMLINKS := \
    /vendor/firmware_mnt:/firmware \
    /mnt/vendor/persist:/persist
TARGET_USES_MKE2FS := true
BOARD_ROOT_EXTRA_FOLDERS := firmware firmware-modem

# Filesystem
TARGET_FS_CONFIG_GEN += $(DEVICE_PATH)/config.fs

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_MODEM_TYPE := xmm6360
BOARD_GLOBAL_CFLAGS += -DSEC_PRODUCT_FEATURE_RIL_CALL_DUALMODE_CDMAGSM


# Bionic
TARGET_LD_SHIM_LIBS := \
 /system/vendor/lib/libexynoscamera.so|libsamsung_symbols.so:/system/vendor/bin/gpsd|libdmitry.so:/system/vendor/lib/libsec-ril.so|libsamsung_symbols.so

# Camera: portrait orientation
BOARD_CAMERA_FRONT_ROTATION := 270
BOARD_CAMERA_BACK_ROTATION := 90

# Battery
RED_LED_PATH := "/sys/class/leds/led_r/brightness" 
GREEN_LED_PATH := "/sys/class/leds/led_g/brightness" 
BLUE_LED_PATH := "/sys/class/leds/led_b/brightness" 
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"

# HDMI
BOARD_HDMI_INCAPABLE := true

# NFC
BOARD_HAVE_NFC := true
BOARD_NFC_HAL_SUFFIX := universal5420

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/ha3g/sepolicy

# NFC
include device/samsung/ha3g/nfc/bcm2079x/board.mk


# Inherit from the proprietary version
-include vendor/samsung/ha3g/BoardConfigVendor.mk

# Linker
TARGET_LD_SHIM_LIBS += /system/vendor/lib/egl/libGLES_mali.so|libgutils.so
