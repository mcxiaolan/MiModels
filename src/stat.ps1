if ((fastboot getvar product 2>&1 | Out-String) -match 'product:\s*(\S+)') {
    $DEVICE = $Matches[1]
    Write-Host "设备代号: $DEVICE"
} else {
    Write-Host "错误: 未能获取到设备代号。请检查 Fastboot 连接。"
    exit 1
}

if ((Invoke-RestMethod "https://mi.ltya.top/product.csv") -match "(?m)^$DEVICE\s*,\s*(.*)") {
    Write-Host "设备型号: $($Matches[1].Trim())"
} else {
    Write-Host "设备型号: 未在列表中找到该代号"
}

Write-Host "`n获取解锁状态"
fastboot getvar unlocked

Write-Host "`n查询设备信息"
fastboot oem device-info

Write-Host "`nMade by Lantianya(FlyYoung) 酷安@我是岚天呀`n"

Write-Host -NoNewline "请按任意键继续..."
$null = [Console]::ReadKey($true)