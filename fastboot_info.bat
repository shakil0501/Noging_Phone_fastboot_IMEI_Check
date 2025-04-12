@echo off
title SHUNLOCKER - Fastboot IMEI & Model Checker
color 1F
cls

:: Display SHUNLOCKER header
echo ****************************************************
echo              SHUNLOCKER - Fastboot Tool
echo ****************************************************

:: Add some fancy text
echo.
echo Checking device in fastboot mode...
echo.

:: Check if fastboot is installed
fastboot --version
if %errorlevel% neq 0 (
    echo Fastboot is not installed. Please install it first.
    pause
    exit /b
)

:: Connect to the Nothing phone in fastboot mode
fastboot devices
if %errorlevel% neq 0 (
    echo No device detected. Please make sure the phone is in fastboot mode and connected.
    pause
    exit /b
)

:: Display a separator line
echo --------------------------------------------------------

:: Get the model and IMEI info
echo Fetching model and IMEI...
echo.

:: Display device information
fastboot oem device-info
echo.
fastboot getvar imei
echo.

:: Final message
echo --------------------------------------------------------
echo Done! Press any key to exit.
pause >nul
