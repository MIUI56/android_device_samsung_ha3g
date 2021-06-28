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

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gps.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml

# Ramdisk
PRODUCT_PACKAGES += \
    init.baseband.rc \
    init.target.rc

# Radio
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    libxml2 \
    rild \
    libril \
    libreference-ril \
    android.hardware.radio@1.0 \
    android.hardware.radio.deprecated@1.0


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init/rild.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/rild.legacy.rc
# Shims
PRODUCT_PACKAGES += \
    libshim_gps

# Vendor security patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2016-11-01
# System properties
include device/samsung/ha3g/system_prop

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay \
 PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS +=  device/samsung/ha3g/lineage-sdk 

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := xlarge PRODUCT_AAPT_PREF_CONFIG := xhdpi
# A list of dpis to select prebuilt apk, in precedence order.
PRODUCT_AAPT_PREBUILT_DPI := hdpi mdpi


# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/mixer_paths_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_0.xml 
\
    $(DEVICE_PATH)/configs/audio/ysound.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ysound.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# call the proprietary setup
$(call inherit-product, vendor/samsung/ha3g/ha3g-vendor.mk)

# Inherit from universal5420-common
$(call inherit-product, device/samsung/universal5420-common/device-common.mk)


# NFC
$(call inherit-product, device/samsung/ha3g/nfc/bcm2079x/product.mk)
