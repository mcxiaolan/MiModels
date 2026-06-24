#!/bin/sh

DEVICE=$(fastboot getvar product 2>&1 | awk '/product:/ {print $2}')

if [ -z "$DEVICE" ]; then
    echo "错误: 未能获取到设备代号。请检查 Fastboot 连接。"
    exit 1
fi

echo "设备代号: $DEVICE"

curl -s "https://mimodels.ltya.top/product.csv" | awk -F', ' -v code="$DEVICE" '
    $1 == code { print "设备型号: " $2; found=1; exit }
    END { if (!found) print "设备型号: 未在列表中找到该代号" }
'

echo -e "\n获取解锁状态"
fastboot getvar unlocked

echo -e "\n查询设备信息"
fastboot oem device-info

echo -e "\nMade by Lantianya(FlyYoung) 酷安@我是岚天呀\n"

echo -n "请按任意键继续..."
read -r _