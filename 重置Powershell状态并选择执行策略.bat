@echo off
:: ����Ȩ�ޣ�ȷ���ű��Թ���ԱȨ������
:: ����Ƿ��Թ���Ա�������
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ���Թ���Ա������д��������ļ���
    pause
    exit /b
)

:: ��� PowerShell ��ʷ���������ļ��б�
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{CEBFF5CD-ACE2-4F4F-9178-9926F41749EA}\Count" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /v MRUList /f

:: ɾ�� PowerShell �����ļ���profile.ps1��
if exist "%USERPROFILE%\Documents\WindowsPowerShell\profile.ps1" (
    del "%USERPROFILE%\Documents\WindowsPowerShell\profile.ps1" /f
)

if exist "%USERPROFILE%\Documents\PowerShell\profile.ps1" (
    del "%USERPROFILE%\Documents\PowerShell\profile.ps1" /f
)

:: ��� PowerShell ������Զ���ģ��
if exist "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\PowerShell" (
    rd /s /q "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\PowerShell"
)

if exist "%USERPROFILE%\AppData\Local\Microsoft\Windows\PowerShell" (
    rd /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\PowerShell"
)

:: �ṩ����ʽѡ����û�ѡ��ִ�в���
echo ��ѡ��Ҫ���õ� PowerShell ִ�в���:
echo 1. Restricted (��ֹ�����κνű�)
echo 2. RemoteSigned (�������б��ؽű���Զ�̽ű���Ҫǩ��)
echo 3. Unrestricted (�����������нű���������)
set /p choice="����������ѡ�� (1/2/3): "

if "%choice%"=="1" (
    powershell -Command "Set-ExecutionPolicy Restricted -Scope CurrentUser -Force"
    echo �ѽ�ִ�в�������Ϊ Restricted��
) else if "%choice%"=="2" (
    powershell -Command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force"
    echo �ѽ�ִ�в�������Ϊ RemoteSigned��
) else if "%choice%"=="3" (
    powershell -Command "Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force"
    echo �ѽ�ִ�в�������Ϊ Unrestricted��
) else (
    echo ��Ч��ѡ�����������нű���ѡ�� 1, 2, �� 3��
    pause
    exit /b
)

:: ��ʾ�û��������
echo PowerShell ִ�в�����������ϡ�
pause
