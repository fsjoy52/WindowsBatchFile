@echo off
chcp 65001 >nul 2>&1
setlocal enabledelayedexpansion

rem ##################################################
rem 作者信息：
rem 作者：ruanjianleida
rem ##################################################

rem 提示用户输入程序执行文件的完整路径
set "ProgramPath="
set /p "ProgramPath=请输入程序执行文件的完整路径（例如：D:\Program Files\Tencent\Weixin\Weixin.exe ）："

rem 调试输出用户输入的路径
echo 用户输入的路径: "%ProgramPath%"

rem 检查路径格式是否正确
if not exist "%ProgramPath%" (
    echo 指定路径的程序 "%ProgramPath%" 不存在或路径格式不正确。
    pause
    exit /b 1
)

rem 提示用户输入要打开的窗口数
set "NumberOfInstances="
set /p "NumberOfInstances=请输入要打开的窗口数："

rem 确保用户输入的窗口数是有效的数字
for /f "delims=0123456789" %%i in ("%NumberOfInstances%") do (
    echo 输入的窗口数无效：%NumberOfInstances%
    pause
    exit /b 1
)

rem 启动指定数量的程序实例
for /l %%n in (1,1,%NumberOfInstances%) do (
    start "" "%ProgramPath%"
)

rem 等待用户按任意键继续
pause

endlocal
