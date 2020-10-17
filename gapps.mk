#
# Copyright (C) 2019-2020 The LineageOS Project
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

PRODUCT_COPY_FILES += \
    $(shell tar -zxf vendor/gapps/common/proprietary/product/priv-app/Velvet/Velvet.apk.tar.gz -C vendor/gapps/common/proprietary/product/priv-app/Velvet/)

LOCAL_DEVICE := $(lastword $(subst _, ,$(TARGET_PRODUCT)))

# Include product overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/gapps/overlay/

# RRO Overlays
PRODUCT_PACKAGES += \
    PixelLauncherOverlay

PRODUCT_PACKAGES += \
    PixelConfigOverlay2018 \
    PixelConfigOverlay2019 \
    PixelConfigOverlay2019Midyear \
    PixelDocumentsUIGoogleOverlay \
    PixelSetupWizardOverlay \
    PixelSetupWizardOverlay2019

PRODUCT_PACKAGES += \
    FilesOverlay \
    FontArbutusSource \
    FontArvoLato \
    FontRubikRubik \
    IconPackCircularAndroid \
    IconPackCircularPixelLauncher \
    IconPackCircularPixelThemePicker \
    IconPackCircularSettings \
    IconPackCircularSystemUI \
    IconPackFilledAndroid \
    IconPackFilledPixelLauncher \
    IconPackFilledPixelThemePicker \
    IconPackFilledSettings \
    IconPackFilledSystemUI \
    IconPackRoundedAndroid \
    IconPackRoundedPixelLauncher \
    IconPackRoundedPixelThemePicker \
    IconPackRoundedSettings \
    IconPackRoundedSystemUI \
    IconShapePebble \
    IconShapeRoundedRect \
    IconShapeSquircle \
    IconShapeTaperedRect \
    IconShapeTeardrop \
    IconShapeVessel \
    NavigationBarMode3Button \
    NavigationBarModeGestural \
    NavigationBarModeGesturalExtraWideBack \
    NavigationBarModeGesturalNarrowBack \
    NavigationBarModeGesturalWideBack

# Permissions
PRODUCT_COPY_FILES += \
    vendor/gapps/product/etc/permissions/privapp-permissions-pixel.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-pixel.xml

# Gboard configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.theme_id=5 \
    ro.com.google.ime.system_lm_dir=/product/usr/share/ime/google/d3_lms

# SetupWizard configuration
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.rotation_locked=true \
    setupwizard.enable_assist_gesture_training=true \
    setupwizard.theme=glif_v3_light \
    setupwizard.feature.skip_button_use_mobile_data.carrier1839=true \
    setupwizard.feature.show_pai_screen_in_main_flow.carrier1839=false \
    setupwizard.feature.show_pixel_tos=false

# OPA configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.opa.eligible_device=true

# Google legal
PRODUCT_PRODUCT_PROPERTIES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html

# Google Play services configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=android-google \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent

$(call inherit-product, vendor/gapps/common/common-vendor.mk)
