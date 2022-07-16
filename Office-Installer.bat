@echo off
set "_dir=%~dp0"
set "_dir=%_dir:~0,-1%"
cd "%_dir%"
title Microsoft Office Deployment Tool Installer
cls
reg add HKLM /v AdminCheck /t REG_DWORD /d 0 /f >nul 2>nul
if "%errorlevel%" == "1" (
    color c
    echo.
    echo Microsoft Office Deployment Tool Installer
    echo.
    echo ============================
    echo ERROR: Run as Administrator!
    echo ============================
    echo.
    pause
    exit
) else (
    reg delete HKLM /v AdminCheck /f >nul 2>nul
)
ping -n 1 -4 google.com >nul 2>nul
if "%errorlevel%" == "1" (
    color c
    echo.
    echo Microsoft Office Deployment Tool Installer
    echo.
    echo ==============================
    echo ERROR: No Internet Connection!
    echo ==============================
    echo.
    pause
    exit
)
if exist "setup.exe" (
    if exist "configuration-Office365-x64.xml" (
        if exist "configuration-Office365-x86.xml" (
            if exist "configuration-Office2021Enterprise.xml" (
                if exist "configuration-Office2019Enterprise.xml" (
                    goto menu
                ) else (
                    color c
                    echo.
                    echo           Microsoft Office Deployment Tool Installer
                    echo.
                    echo           ==============================
                    echo           ERROR: MISSING REQUIRED FILES!
                    echo           ==============================
                    echo.
                    pause
                    exit
                )
            ) else (
                color c
                echo.
                echo           Microsoft Office Deployment Tool Installer
                echo.
                echo           ==============================
                echo           ERROR: MISSING REQUIRED FILES!
                echo           ==============================
                echo.
                pause
                exit
            )
        ) else (
            color c
            echo.
            echo           Microsoft Office Deployment Tool Installer
            echo.
            echo           ==============================
            echo           ERROR: MISSING REQUIRED FILES!
            echo           ==============================
            echo.
            pause
            exit
        )
    ) else (
        color c
        echo.
        echo           Microsoft Office Deployment Tool Installer
        echo.
        echo           ==============================
        echo           ERROR: MISSING REQUIRED FILES!
        echo           ==============================
        echo.
        pause
        exit
    )
) else (
    color c
    echo.
    echo           Microsoft Office Deployment Tool Installer
    echo.
    echo           ==============================
    echo           ERROR: MISSING REQUIRED FILES!
    echo           ==============================
    echo.
    pause
    exit
)
:menu
color b
echo.
echo           Microsoft Office Deployment Tool Installer
echo.
echo           ============================
echo           [1] Install Office 365 x64
echo           [2] Install Office 365 x86
echo           [3] Install Office LTSC 2021
echo           [4] Install Office LTSC 2019
echo           ============================
echo           [5] Exit
choice /c:12345 /n >nul 2>nul
if "%errorlevel%" == "1" goto 365-64
if "%errorlevel%" == "2" goto 365-86
if "%errorlevel%" == "3" goto LTSC-2021
if "%errorlevel%" == "4" goto LTSC-2019
if "%errorlevel%" == "5" exit
:365-64
cls
echo.
echo Microsoft Office Deployment Tool Installer
echo.
echo ==========================================
echo Downloading ^& Installing Office 365 x64...
echo ==========================================
setup.exe /configure configuration-Office365-x64.xml
cls
color a
echo.
echo Microsoft Office Deployment Tool Installer
echo.
echo ======================================
echo Successfully Installed Office 365 x64!
echo ======================================
echo.
pause
cls
goto menu
:365-86
cls
echo.
echo Microsoft Office Deployment Tool Installer
echo.
echo ==========================================
echo Downloading ^& Installing Office 365 x86...
echo ==========================================
setup.exe /configure configuration-Office365-x86.xml
cls
color a
echo.
echo Microsoft Office Deployment Tool Installer
echo.
echo ======================================
echo Successfully Installed Office 365 x86!
echo ======================================
echo.
pause
cls
goto menu
:LTSC-2021
cls
echo.
echo Microsoft Office Deployment Tool Installer
echo.
echo ============================================
echo Downloading ^& Installing Office LTSC 2021...
echo ============================================
setup.exe /configure configuration-Office2021Enterprise.xml
cls
color a
echo.
echo Microsoft Office Deployment Tool Installer
echo.
echo ========================================
echo Successfully Installed Office LTSC 2021!
echo ========================================
echo.
pause
cls
goto menu
:LTSC-2019
cls
echo.
echo Microsoft Office Deployment Tool Installer
echo.
echo ============================================
echo Downloading ^& Installing Office LTSC 2019...
echo ============================================
setup.exe /configure configuration-Office2019Enterprise.xml
cls
color a
echo.
echo Microsoft Office Deployment Tool Installer
echo.
echo ========================================
echo Successfully Installed Office LTSC 2019!
echo ========================================
echo.
pause
cls
goto menu
