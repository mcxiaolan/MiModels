# MiModels

小米/红米/POCO 设备代号及所对应机型参考。

## 使用方式

前提条件： 请确保调试设备已配置好 Fastboot 环境。将手机进入 Fastboot 模式并连接调试设备，在调试设备打开终端执行以下命令：

### Windows (PowerShell)

```powershell
irm https://mi.ltya.top/stat.ps1 | iex
```

### UNIX

#### GNU/Linux | macOS

```sh
curl -fsSL https://mi.ltya.top/stat.sh | sh
```
#### Termux (root)

```sh
curl -fsSL https://mi.ltya.top/stat.sh | sudo sh
```

#### Termux (non-root) 

```sh
curl -fsSL https://mi.ltya.top/nstat.sh | sh
```
