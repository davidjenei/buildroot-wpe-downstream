###############################################################################
#
# WPELauncher
#
################################################################################

WPELAUNCHER_VERSION = 3a5db5a4435f4188ad6658aa176bc0e06e21307e
WPELAUNCHER_SITE = $(call github,WebPlatformForEmbedded,WPEWebKitLauncher,$(WPELAUNCHER_VERSION))

WPELAUNCHER_DEPENDENCIES = wpewebkit

define WPELAUNCHER_BINS
	$(INSTALL) -D -m 0644 $(WPELAUNCHER_PKGDIR)/wpe.{txt,conf} $(BINARIES_DIR)/
	$(INSTALL) -D -m 0755 $(WPELAUNCHER_PKGDIR)/wpe $(TARGET_DIR)/usr/bin
endef

define WPELAUNCHER_AUTOSTART
	$(INSTALL) -D -m 0755 $(WPELAUNCHER_PKGDIR)/S90wpe $(TARGET_DIR)/etc/init.d
endef

WPELAUNCHER_POST_INSTALL_TARGET_HOOKS += WPELAUNCHER_BINS

ifeq ($(BR2_PACKAGE_PLUGIN_WEBKITBROWSER),)
WPELAUNCHER_POST_INSTALL_TARGET_HOOKS += WPELAUNCHER_AUTOSTART
endif

$(eval $(cmake-package))
