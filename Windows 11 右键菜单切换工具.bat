@echo off
rem =====================================================
rem  Windows 11 �Ҽ��˵��л����� (ANSI/GBK ����)
rem =====================================================
echo.
echo =====================================
echo   Windows 11 �Ҽ��˵��л�����
echo =====================================
echo.
echo 1. �л��� Win10 �����Ҽ��˵���ȫչ����
echo 2. �ָ�Ϊ Windows 11 Ĭ���۵�ʽ�Ҽ��˵�
echo 3. �˳�
echo.

set /p choice="������ѡ�� (1/2/3)��"

if /i "%choice%"=="1" goto classic
if /i "%choice%"=="2" goto restore
if /i "%choice%"=="3" goto end
echo.
echo ��Ч���룬���������нű������� 1��2 �� 3��
goto end

:classic
echo.
echo �����л��� Win10 �����Ҽ��˵���
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /f
if errorlevel 1 (
    echo �����޷�д��ע���
    goto pause
)
echo �������� Explorer��
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe >nul
echo �л���ɣ������Ҽ��˵��Ƿ��ѻָ���������ʽ��
goto pause

:restore
echo.
echo ���ڻָ�Ϊ Windows 11 Ĭ���Ҽ��˵���
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
if errorlevel 1 (
    echo �����޷�ɾ��ע���������Ѳ����ڣ���
    goto pause
)
echo �������� Explorer��
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe >nul
echo �ָ���ɣ������Ҽ��˵��Ƿ��ѻָ��� Windows 11 ��Ĭ����ʽ��
goto pause

:pause
echo.
pause
:end