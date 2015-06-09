# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from the proprietary version
-include vendor/motorola/motus/BoardConfigVendor.mk

TARGET_BOARD_INFO_FILE ?= device/motorola/motus/board-info.txt

# Boot Animation
#TARGET_SCREEN_HEIGHT := 800
#TARGET_SCREEN_WIDTH := 480
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true

# Hardware
TARGET_BOARD_PLATFORM := msm7k
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv6j
TARGET_CPU_ABI := armeabi-v6j
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_BOOTLOADER_BOARD_NAME := motus
TARGET_NO_BOOTLOADER := true
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_OTA_ASSERT_DEVICE := motu,motus
BOARD_VENDOR_USE_AKMD := akm8973
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_HARDWARE := true

# Enable dalvik startup with a low memory footprint
TARGET_ARCH_LOWMEM := true

# Kernel
TARGET_PREBUILT_KERNEL := device/motorola/motus/kernel
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null earlyprintk quiet mtdparts=msm_nand:3072k@45M(boot),305408k(system),65536k(userdata),256k(misc),5120k(recovery),98304k(cache),-(splash)
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_CUSTOM_USB_CONTROLLER := ../../device/motorola/motus/UsbController.cpp

# Browser JS engine
JS_ENGINE := v8

# WiFi
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := WEXT
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_MODULE_PATH     := "/system/lib/dhd.ko"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/sdio-g-cdc-reclaim-wme.bin nvram_path=/system/etc/wifi/nvram.txt"
WIFI_DRIVER_MODULE_NAME     := "dhd"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/motorola/motus/bluetooth

PRODUCT_AAPT_CONFIG := small normal
PRODUCT_AAPT_PREF_CONFIG := normal

# fix this up by examining /proc/mtd on a running device
# # dev:    size   erasesize  name
#mtd0: 00300000 00020000 "boot"
#mtd1: 0a140000 00020000 "system"
#mtd2: 0bf00000 00020000 "userdata"
#mtd3: 00040000 00020000 "misc"
#mtd4: 00500000 00020000 "recovery"
#mtd5: 06a00000 00020000 "cache"
#mtd6: 00080000 00020000 "splash"

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00300000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x12a00000 #0x08ac0000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x04040000 #0x0df80000
BOARD_FLASH_BLOCK_SIZE := 131072

# System
WITH_DEXPREOPT := false

# Graphics
BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true
BOARD_USE_SKIA_LCDTEXT := true
BOARD_EGL_NEEDS_LEGACY_FB := true
BOARD_EGL_CFG := device/motorola/motus/egl.cfg
TARGET_DISABLE_TRIPLE_BUFFERING := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
TARGET_SF_NEEDS_REAL_DIMENSIONS := true
TARGET_SKIA_USE_MORE_MEMORY := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2

# Camera
BOARD_NEEDS_MEMORYHEAPPMEM := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7k
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 3200
BOARD_VENDOR_QCOM_AMSS_VERSION := 3200
BOARD_USES_GPSSHIM := false

# Audio
BOARD_USES_LIBMEDIA_WITH_AUDIOPARAMETER := true
BOARD_USES_GENERIC_AUDIO := false
TARGET_PROVIDES_LIBAUDIO := true

# Power
TARGET_POWERHAL_VARIANT := cm

# Vibrator
BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/motorola/motus/vibrator.c

# Recovery
TARGET_RECOVERY_PRE_COMMAND := "setrecovery recovery"
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/motorola/motus/recovery/recovery_ui.c

TARGET_PREBUILT_RECOVERY_KERNEL := device/motorola/motus/recovery_kernel

#BOARD_SEPOLICY_DIRS := \
#        device/motorola/motus/sepolicy
#
#BOARD_SEPOLICY_UNION := \
#        genfs_contexts \
#        file_contexts

