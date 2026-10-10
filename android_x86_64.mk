#
# Copyright 2013 The Android Open-Source Project
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

# Use the release ART APEX for the production-compatible BlueStacks guest,
# including eng builds used by the Windows image pipeline.
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# includes the base of Android-x86 platform
$(call inherit-product,device/generic/common/x86_64.mk)

# BlueStacks runtime services required by the Windows Android-x86_64 image.
PRODUCT_PACKAGES += \
    hwservicemanager \
    hwservicemanager_compat_symlink_module \
    vndservicemanager \
    android.hardware.power-service.example

# BS-A16: the ro.hardware.*=bst props leak the custom HALs to Play
# Integrity device fingerprinting (A13 leaves them unset).
# libhardware resolves the legacy passthrough HALs via its explicit
# "bst" fallback before the default, so the props are unnecessary.

# Linux 6.12 no longer exposes /dev/ashmem. Use the kernel's enabled ashmem
# compatibility layer for legacy BlueStacks gralloc buffers backed by memfd.
PRODUCT_SYSTEM_PROPERTIES += \
    sys.use_memfd=true

# Preserve the validated AOSP16 qvirt policy on the Windows product. Android
# 16 enforces this globally; keeping it here documents the board-level source.
PRODUCT_ENFORCE_VINTF_MANIFEST := true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240

# Overrides
PRODUCT_NAME := android_x86_64
PRODUCT_BRAND := Android-x86
PRODUCT_DEVICE := x86_64
PRODUCT_MODEL := Generic Android-x86_64
