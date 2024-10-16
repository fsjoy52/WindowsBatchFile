@echo off
:menu
cls
echo ===========================================
echo       Recall Feature Management Script
echo ===========================================
echo.
echo 1. Check Recall Feature Status
echo 2. Disable Recall Feature
echo 3. Enable Recall Feature
echo 4. Exit
echo.
set /p choice="Please choose an option (1-4): "

if "%choice%"=="1" goto check
if "%choice%"=="2" goto disable
if "%choice%"=="3" goto enable
if "%choice%"=="4" goto exit

echo Invalid choice. Please select a valid option.
pause
goto menu

:check
cls
echo Checking Recall feature status...
Dism /Online /Get-FeatureInfo /FeatureName:Recall
pause
goto menu

:disable
cls
echo Disabling Recall feature...
Dism /Online /Disable-Feature /FeatureName:Recall
pause
goto menu

:enable
cls
echo Enabling Recall feature...
Dism /Online /Enable-Feature /FeatureName:Recall
pause
goto menu

:exit
exit
