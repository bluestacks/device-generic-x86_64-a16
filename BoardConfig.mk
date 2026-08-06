#
# Product-specific compile-time definitions.
#

# The generic product target doesn't have any hardware-specific pieces.
TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := x86_64
TARGET_ARCH := x86_64
TARGET_ARCH_VARIANT := x86_64

TARGET_2ND_CPU_ABI := x86
TARGET_2ND_ARCH := x86
TARGET_2ND_ARCH_VARIANT := x86_64

TARGET_CPU_ABI_LIST_64_BIT := $(TARGET_CPU_ABI) $(TARGET_CPU_ABI2) $(NATIVE_BRIDGE_ABI_LIST_64_BIT)
TARGET_CPU_ABI_LIST_32_BIT := $(TARGET_2ND_CPU_ABI) $(TARGET_2ND_CPU_ABI2) $(NATIVE_BRIDGE_ABI_LIST_32_BIT)
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI) $(TARGET_CPU_ABI2) $(TARGET_2ND_CPU_ABI) $(TARGET_2ND_CPU_ABI2) $(NATIVE_BRIDGE_ABI_LIST_32_BIT) $(NATIVE_BRIDGE_ABI_LIST_64_BIT)

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USERDATAIMAGE_PARTITION_SIZE := 576716800
BOARD_CACHEIMAGE_PARTITION_SIZE := 69206016
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

include device/generic/common/BoardConfig.mk

# Intel's Houdini package installs its payload through LOCAL_POST_INSTALL_CMD.
BUILD_BROKEN_INCORRECT_PARTITION_IMAGES := true

BOARD_SEPOLICY_DIRS += device/generic/common/sepolicy/houdini

# android_x86_64 does not inherit the goldfish generic product, so attach the
# retained BlueStacks HAL declarations and the external HIDL graphics stack.
DEVICE_MANIFEST_FILE += device/generic/x86_64/manifest_bst_legacy_hal.xml
DEVICE_MANIFEST_FILE += device/generic/common/manifest/android.hardware.graphics.allocator@2.0.xml
DEVICE_MANIFEST_FILE += device/generic/common/manifest/android.hardware.graphics.composer@2.1.xml
DEVICE_MANIFEST_FILE += device/generic/common/manifest/android.hardware.graphics.mapper@2.1.xml

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    device/generic/x86_64/framework_compatibility_matrix.xml
