#
# Copyright (C) 2013 The CyanogenMod Project
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

LOCAL_PATH := device/samsung/ha3g

# Platform
BOARD_VENDOR := samsung
TARGET_SOC := exynos5420

# Audio HAL variant
TARGET_AUDIOHAL_VARIANT := samsung


# Radio
BOARD_PROVIDES_LIBRIL := true
# hardware/samsung/ril
BOARD_MODEM_TYPE := xmm6360

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Bootloader
TARGET_OTA_ASSERT_DEVICE := ha3g

# Kernel
TARGET_KERNEL_CONFIG := lineageos_ha3g_defconfig

# IR Blaster
IR_HAS_ONE_FREQ_RANGE := true

# Battery
RED_LED_PATH := "/sys/class/leds/led_r/brightness"
GREEN_LED_PATH := "/sys/class/leds/led_g/brightness"
BLUE_LED_PATH := "/sys/class/leds/led_b/brightness"
BACKLIGHT_PATH := "/sys/class/backlight/panel/brightness"

# HDMI
BOARD_USES_GSC_VIDEO := true

# Include path
TARGET_SPECIFIC_HEADER_PATH += $(LOCAL_PATH)/include

# NFC
BOARD_HAVE_NFC := true
BOARD_NFC_HAL_SUFFIX := universal5420

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 11534336
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 13631488
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2398552064
# userdata = 27912056832 = (27912073216 - 16384 <encryption footer>)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27912056832
BOARD_CACHEIMAGE_PARTITION_SIZE := 309616640
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/ha3g/sepolicy

# Camera: portrait orientation
BOARD_CAMERA_FRONT_ROTATION := 270
BOARD_CAMERA_BACK_ROTATION := 90


# HIDL
DEVICE_MANIFEST_FILE += $(LOCAL_PATH)/manifest.xml

  # Legacy BLOB Support
TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/vendor/bin/hw/rild=27

# Network Routing
TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

# Shims
TARGET_LD_SHIM_LIBS += \
    /vendor/bin/gpsd|/vendor/lib/libshim_gps.so

# Display
TARGET_SCREEN_DENSITY := 480

# Inherit from universal5420-common
include device/samsung/universal5420-common/BoardConfigCommon.mk

# Inherit from the proprietary version
include vendor/samsung/ha3g/BoardConfigVendor.mk

# NFC
include device/samsung/ha3g/nfc/bcm2079x/board.mk

# Input device
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/Synaptics_HID_TouchPad.idc:system/usr/idc/Synaptics_HID_TouchPad.idc 
\
    $(LOCAL_PATH)/configs/idc/sec_e-pen.idc:system/usr/idc/sec_e-pen.idc
# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl
