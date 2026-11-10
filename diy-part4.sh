#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part4.sh
# Description: OpenWrt DIY script part 4 (After Update feeds)
#              AX3000 only (Cudy TR3000 v1 256MB, mediatek/filogic).
#              Same shape as diy-part3.sh (X86), but with AX3000 values.
#              Used by 25.12_AX3000.yml via DIY_P2_SH: diy-part4.sh.
#              Do NOT point X86/R2s workflows at this file.
#

# -----------------------------
# 一、修改默认 IP
# -----------------------------
# 192.168.2.1：避开 F50 的 192.168.0.1，也避开家里软路由的 192.168.50.1
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# -----------------------------
# 二、修改机器名称
# -----------------------------
sed -i 's/ImmortalWrt/OpenWrt-AX3000/g' package/base-files/files/bin/config_generate

# -----------------------------
# 三、在概览页面显示编译日期和构建者信息
# -----------------------------
sed -i "s/%D %V/%D %V | Build by Blacknesswing | Compiled on $(date '+%Y-%m-%d') |/g" \
    package/base-files/files/usr/lib/os-release

# -----------------------------
# 四、说明：这里没有 diy-part2.sh 的 rockchip 换口，
#    也没有 diy-part3.sh 的 fix-x86-model 脚本
#    TR3000 是 mediatek/filogic，WAN/LAN 默认就是对的，
#    也没有 DMI，装 x86 型号修复脚本反而会把型号写成 X86 Router。
# -----------------------------
