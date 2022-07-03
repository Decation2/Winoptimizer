title Optimizer by Decation
::MAIN MENU
@ECHO off
:MAINMENU
CLS
COLOR 0a
ECHO				Optimizer by Decation
ECHO			    To make your windows faster!
ECHO			    Options:
ECHO			    [ 1 ] Disable NVIDIA Telemetry
ECHO			    [ 2 ] Disable windows telemetry and cortana
SET /p _choice=     Enter your choice:
@REM checking the choice
IF /I "%_choice%" == "1" (
	GOTO OPTION1
	)

    IF /I "%_choice%" == "2" (
	GOTO OPTION2
	)

::First option to disable Nvidia Telemetry

:OPTION1
SCHTASKS /Change /TN "\NvTmMon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" /Disable 
SCHTASKS /Change /TN "\NvTmRep_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" /Disable
SCHTASKS /Change /TN "\NvTmRepOnLogon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" /Disable
@REM sending the user back to menu
goto :MAINMENU
@REM Option2
:OPTION2
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\SQMClient" /v "CorporateSQMURL" /t REG_SZ /d 127.0.0.1 /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Steps-Recorder" /v "Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Telemetry" /v "Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Inventory" /v "Enabled" /t REG_DWORD /d 0 /f 
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Compatibility-Troubleshooter" /v "Enabled" /t REG_DWORD /d 0 /f 
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Compatibility-Assistant/Trace" /v "Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Compatibility-Assistant/Compatibility-Infrastructure-Debug" /v "Enabled" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Compatibility-Assistant/Analytic" /v "Enabled" /t REG_DWORD /d 0 /f 
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Compatibility-Assistant" /v "Enabled" /t REG_DWORD /d 0 /f 
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
REG ADD "HKLM\COMPONENTS\DerivedData\Components\amd64_microsoft-windows-c..lemetry.lib.cortana_31bf3856ad364e35_10.0.10240.16384_none_40ba2ec3d03bceb0" /v "f!proactive-telemetry-inter_58073761d33f144b" /t REG_DWORD /d 0 /f
REG ADD "HKLM\COMPONENTS\DerivedData\Components\amd64_microsoft-windows-c..lemetry.lib.cortana_31bf3856ad364e35_10.0.10240.16384_none_40ba2ec3d03bceb0" /v "f!proactive-telemetry-event_8ac43a41e5030538" /t REG_DWORD /d 0 /f
REG ADD "HKLM\COMPONENTS\DerivedData\Components\amd64_microsoft-windows-c..lemetry.lib.cortana_31bf3856ad364e35_10.0.10240.16384_none_40ba2ec3d03bceb0" /v "f!proactive-telemetry.js" /t REG_DWORD /d 0 /f
REG ADD "HKLM\COMPONENTS\DerivedData\Components\amd64_microsoft-windows-c..lemetry.lib.cortana_31bf3856ad364e35_10.0.10240.16384_none_40ba2ec3d03bceb0" /v "f!dss-winrt-telemetry.js" /t REG_DWORD /d 0 /f
REG ADD "HKCU\SOFTWARE\Policies\Microsoft\Internet Explorer\Main" /v "RunOnceComplete" /t REG_DWORD /d 1 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 0 /f
@REM sending the user back to menu
goto :MAINMENU
