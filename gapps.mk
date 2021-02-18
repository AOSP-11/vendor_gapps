#
# Copyright (C) 2019-2021 The LineageOS Project
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

ifeq ($(wildcard vendor/gapps/common/proprietary/product/priv-app/Velvet/Velvet.apk),)
PRODUCT_COPY_FILES += \
    $(shell tar -zxf vendor/gapps/common/proprietary/product/priv-app/Velvet/Velvet.apk.tar.gz -C vendor/gapps/common/proprietary/product/priv-app/Velvet/)
endif

LOCAL_DEVICE := $(lastword $(subst _, ,$(TARGET_PRODUCT)))

# Include Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/gapps/overlay \
    vendor/gapps/overlay-pixel

DEVICE_PACKAGE_OVERLAYS += \
    vendor/gapps/overlay/common \
    vendor/gapps/overlay-pixel/common

# RRO Overlays
PRODUCT_PACKAGES += \
    CellBroadcastServiceOverlay \
    FilesOverlay \
    FontArbutusSourceOverlay \
    FontArvoLatoOverlay \
    FontKaiOverlay \
    FontRubikRubikOverlay \
    FontSamOverlay \
    FontVictorOverlay \
    GooglePermissionControllerOverlay \
    GoogleWebViewOverlay \
    PixelConfigOverlay2019 \
    PixelDocumentsUIGoogleOverlay \
    PixelLiveWallpapersOverlay \
    PixelSetupWizardAodOverlay

# IconPack Overlays
PRODUCT_PACKAGES += \
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
    IconPackKaiAndroid \
    IconPackKaiLauncher \
    IconPackKaiSettings \
    IconPackKaiSystemUI \
    IconPackKaiThemePicker \
    IconPackRoundedAndroid \
    IconPackRoundedPixelLauncher \
    IconPackRoundedPixelThemePicker \
    IconPackRoundedSettings \
    IconPackRoundedSystemUI \
    IconPackSamAndroid \
    IconPackSamLauncher \
    IconPackSamSettings \
    IconPackSamSystemUI \
    IconPackSamThemePicker \
    IconPackVictorAndroid \
    IconPackVictorLauncher \
    IconPackVictorSettings \
    IconPackVictorSystemUI \
    IconPackVictorThemePicker \
    IconShapePebble \
    IconShapeRoundedRect \
    IconShapeSquircle \
    IconShapeTaperedRect \
    IconShapeTeardrop \
    IconShapeVessel

# PrebuiltGmsCore
PRODUCT_PACKAGES += \
    AndroidPlatformServices \
    PrebuiltGmsCoreRvc \
    PrebuiltGmsCoreRvc_AdsDynamite \
    PrebuiltGmsCoreRvc_DynamiteLoader \
    PrebuiltGmsCoreRvc_DynamiteModulesA \
    PrebuiltGmsCoreRvc_DynamiteModulesC \
    PrebuiltGmsCoreRvc_GoogleCertificates \
    PrebuiltGmsCoreRvc_MapsDynamite \
    PrebuiltGmsCoreRvc_MeasurementDynamite

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
