@echo off
:: 提升权限，确保脚本以管理员权限运行
:: 检查是否以管理员身份运行
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo 请以管理员身份运行此批处理文件。
    pause
    exit /b
)

:: 清除 PowerShell 历史命令和最近文件列表
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{CEBFF5CD-ACE2-4F4F-9178-9926F41749EA}\Count" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /v MRUList /f

:: 删除 PowerShell 配置文件（profile.ps1）
if exist "%USERPROFILE%\Documents\WindowsPowerShell\profile.ps1" (
    del "%USERPROFILE%\Documents\WindowsPowerShell\profile.ps1" /f
)

if exist "%USERPROFILE%\Documents\PowerShell\profile.ps1" (
    del "%USERPROFILE%\Documents\PowerShell\profile.ps1" /f
)

:: 清除 PowerShell 缓存和自定义模块
if exist "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\PowerShell" (
    rd /s /q "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\PowerShell"
)

if exist "%USERPROFILE%\AppData\Local\Microsoft\Windows\PowerShell" (
    rd /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\PowerShell"
)

:: 提供交互式选项给用户选择执行策略
echo 请选择要设置的 PowerShell 执行策略:
echo 1. Restricted (禁止运行任何脚本)
echo 2. RemoteSigned (允许运行本地脚本，远程脚本需要签名)
echo 3. Unrestricted (允许运行所有脚本，无限制)
set /p choice="请输入您的选择 (1/2/3): "

if "%choice%"=="1" (
    powershell -Command "Set-ExecutionPolicy Restricted -Scope CurrentUser -Force"
    echo 已将执行策略设置为 Restricted。
) else if "%choice%"=="2" (
    powershell -Command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force"
    echo 已将执行策略设置为 RemoteSigned。
) else if "%choice%"=="3" (
    powershell -Command "Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force"
    echo 已将执行策略设置为 Unrestricted。
) else (
    echo 无效的选择，请重新运行脚本并选择 1, 2, 或 3。
    pause
    exit /b
)

:: 提示用户操作完成
echo PowerShell 执行策略已设置完毕。
pause
