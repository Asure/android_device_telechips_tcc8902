# Init setup for Telechips 890x

LOCAL_PATH := $(call my-dir)

# init.rc in the 'official' chinese roms is customised. These customisations should be moved into
# the hardware specific init (init.tcc92xx.rc). 
# Must do clean up later. Once the customisation in init.rc is removed TARGET_PROVIDES_INIT_RC can be set false.

include $(CLEAR_VARS)
LOCAL_MODULE := init.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

# init picks up this file based on the androidboot.hardware kernel cmdline option
include $(CLEAR_VARS)
LOCAL_MODULE := init.tcc92xx.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)
