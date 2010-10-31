# Copyright (C) 2007 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=240 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=180 \
    ro.com.android.dataroaming=false

include $(CLEAR_VARS)
LOCAL_MODULE := pointercal
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/data/data
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE := vold.fstab
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel.x5a
endif

file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file): $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_RECOVERY_ROOT_OUT)/sbin/postrecoveryboot.sh
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/postrecoveryboot.sh | $(ACP)
	$(transform-prebuilt-to-target)
	
# Include other dependencies
include device/telechips/tcc8902/init/init.mk
