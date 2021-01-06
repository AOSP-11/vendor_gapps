include $(call all-subdir-makefiles)

ifeq ($(TARGET_GMS),true)
LIBDMENGINE_SYMLINK := $(TARGET_OUT_PRODUCT)/priv-app/DMService/lib/arm/libdmengine.so
$(LIBDMENGINE_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "libdmengine link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /product/lib/libdmengine.so $@

LIBDMENGINEPLUGIN_SYMLINK := $(TARGET_OUT_PRODUCT)/priv-app/DMService/lib/arm/libdmjavaplugin.so
$(LIBDMENGINEPLUGIN_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "libdmjavaplugin link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /product/lib/libdmjavaplugin.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(LIBDMENGINE_SYMLINK) $(LIBDMENGINEPLUGIN_SYMLINK)
endif
