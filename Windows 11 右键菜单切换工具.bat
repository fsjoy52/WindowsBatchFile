@echo off
rem =====================================================
rem  Windows 11 右键菜单切换工具 (ANSI/GBK 编码)
rem =====================================================
echo.
echo =====================================
echo   Windows 11 右键菜单切换工具
echo =====================================
echo.
echo 1. 切换到 Win10 经典右键菜单（全展开）
echo 2. 恢复为 Windows 11 默认折叠式右键菜单
echo 3. 退出
echo.

set /p choice="请输入选择 (1/2/3)："

if /i "%choice%"=="1" goto classic
if /i "%choice%"=="2" goto restore
if /i "%choice%"=="3" goto end
echo.
echo 无效输入，请重新运行脚本并输入 1、2 或 3。
goto end

:classic
echo.
echo 正在切换到 Win10 经典右键菜单…
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /f
if errorlevel 1 (
    echo 错误：无法写入注册表。
    goto pause
)
echo 正在重启 Explorer…
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe >nul
echo 切换完成！请检查右键菜单是否已恢复到经典样式。
goto pause

:restore
echo.
echo 正在恢复为 Windows 11 默认右键菜单…
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
if errorlevel 1 (
    echo 错误：无法删除注册表项（可能已不存在）。
    goto pause
)
echo 正在重启 Explorer…
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe >nul
echo 恢复完成！请检查右键菜单是否已恢复到 Windows 11 的默认样式。
goto pause

:pause
echo.
pause
:end