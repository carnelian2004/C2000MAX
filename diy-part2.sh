#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# 强制启用 OpenSSL（避免 .config 被覆盖）
echo "CONFIG_PACKAGE_libopenssl=y" >> .config
echo "CONFIG_OPENSSL_WITH_DTLS=y" >> .config

# 清理可能已失败的 OpenSSL 和 ustream-ssl 编译缓存
make package/libs/openssl/clean
make package/libs/ustream-ssl/clean

# 自动配置，避免交互界面
make olddefconfig
