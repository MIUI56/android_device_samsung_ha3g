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

LOCAL_PATH := device/samsung/ha3g

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

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

# Key-layout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/idc/Synaptics_HID_TouchPad.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/Synaptics_HID_TouchPad.idc \
    $(DEVICE_PATH)/configs/idc/Synaptics_RMI4_TouchPad_Sensor.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/Synaptics_RMI4_TouchPad_Sensor.idc \
    $(DEVICE_PATH)/configs/keylayout/Button_Jack.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/Button_Jack.kl \
    $(DEVICE_PATH)/configs/keylayout/gpio_keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio_keys.kl \
    $(DEVICE_PATH)/configs/keylayout/sec_touchkey.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_touchkey.kl \
    $(DEVICE_PATH)/configs/keylayout/sec_touchscreen.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_touchscreen.kl

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init/rild.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/rild.legacy.rc

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Inherit from universal5420-common
$(call inherit-product, device/samsung/universal5420-common/device-common.mk)

# call the proprietary setup
$(call inherit-product-if-exists, vendor/samsung/ha3g/ha3g-vendor.mk)
