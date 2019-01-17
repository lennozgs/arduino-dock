#LOCAL_PATH:= $(call my-dir)
LOCAL_PATH:=/DATA2/DATA/aosp/ODROID/XU4/working_dir/external/twidude
BUILD_DIR:=$(LOCAL_PATH)/build

common_cflags:= \
    -Wno-char-subscripts \
    -Wno-sign-compare \
    -Wno-string-plus-int \
    -Wno-uninitialized \
    -Wno-unused-parameter \
    -funsigned-char \
    -ffunction-sections -fdata-sections \
    -fno-asynchronous-unwind-tables \

common_cflags += \
    -std=gnu89 \
    -pedantic

common_cflags += \
    -pipe -O2 -Wall -Wno-unused-result \
    -MMD -MP -MF $(BUILD_DIR)/$(*D)/$(*F).d

# chipinfo_avr
include $(CLEAR_VARS)
LOCAL_CFLAGS:= $(common_cflags)
LOCAL_LDFLAGS:=
LOCAL_CLANG:= true
LOCAL_CXX_STL:= none
LOCAL_MODULE := libchipinfo_avr_twiboot

LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_SRC_FILES := chipinfo_avr.c

include $(BUILD_STATIC_LIBRARY)

# filedata
include $(CLEAR_VARS)
LOCAL_CFLAGS:= $(common_cflags)
LOCAL_LDFLAGS:=
LOCAL_CLANG:= true
LOCAL_CXX_STL:= none
LOCAL_MODULE := libfiledata_twiboot

LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_SRC_FILES := filedata.c

include $(BUILD_STATIC_LIBRARY)

# multiboot
include $(CLEAR_VARS)
LOCAL_CFLAGS:= $(common_cflags)
LOCAL_LDFLAGS:=
LOCAL_CLANG:= true
LOCAL_CXX_STL:= none
LOCAL_MODULE := libmultiboot_twiboot

LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_SRC_FILES := multiboot.c filedata.c

include $(BUILD_STATIC_LIBRARY)

# optarg
include $(CLEAR_VARS)
LOCAL_CFLAGS:= $(common_cflags)
LOCAL_LDFLAGS:=
LOCAL_CLANG:= true
LOCAL_CXX_STL:= none
LOCAL_MODULE := liboptarg_twiboot

LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_SRC_FILES := optarg.c

include $(BUILD_STATIC_LIBRARY)

# twidude
include $(CLEAR_VARS)

LOCAL_CFLAGS:= $(common_cflags) 
LOCAL_LDFLAGS:=
LOCAL_CLANG:= true 
LOCAL_CXX_STL:= none 
LOCAL_MODULE:= twidude

LOCAL_SRC_FILES := twi.c
LOCAL_C_INCLUDES := $(LOCAL_PATH)

LOCAL_STATIC_LIBRARIES := \
    libchipinfo_avr_twiboot \
    libfiledata_twiboot \
    libmultiboot_twiboot \
    liboptarg_twiboot 

include $(BUILD_EXECUTABLE) 
