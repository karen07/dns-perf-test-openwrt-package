include $(TOPDIR)/rules.mk

PKG_NAME:=dns-perftest
PKG_VERSION:=1.0.0
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0-or-later

ifeq ("$(wildcard ../dns-perftest)", "")
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/karen07/dns-perftest.git
PKG_SOURCE_VERSION:=57abefa419e929dbb39994c14c5d286656cc5677
endif

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/dns-perftest
	SECTION:=net
	CATEGORY:=Network
	DEPENDS:=
	TITLE:=DNS Performance
	URL:=https://github.com/karen07/dns-perftest
endef

define Package/dns-perftest/description
	DNS Performance
endef

ifneq ("$(wildcard ../dns-perftest)", "")
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ../dns-perftest/* $(PKG_BUILD_DIR)/
endef
endif

define Package/dns-perftest/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dns-perftest $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dns-perftest))
