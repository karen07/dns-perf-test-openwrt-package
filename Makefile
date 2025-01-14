include $(TOPDIR)/rules.mk

PKG_NAME:=dns-perf-test
PKG_VERSION:=1.0.0
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0-or-later

ifeq ("$(wildcard ../dns-perf-test)", "")
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/karen07/dns-perf-test.git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
endif

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/dns-perf-test
	SECTION:=net
	CATEGORY:=Network
	DEPENDS:=
	TITLE:=DNS Performance
	URL:=https://github.com/karen07/dns-perf-test
endef

define Package/dns-perf-test/description
	DNS Performance
endef

ifneq ("$(wildcard ../dns-perf-test)", "")
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ../dns-perf-test/* $(PKG_BUILD_DIR)/
endef
endif

define Package/dns-perf-test/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dns-perf-test $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dns-perf-test))
