@echo off
title Auto Push - Poker Solver
echo Automatisch pushen is actief. Dit venster open laten!
echo Ctrl+C om te stoppen.
echo.

cd /d "%~dp0"

:loop
timeout /t 30 /nobreak >nul
git add -A
git diff --cached --quiet
if not %errorlevel%==0 (
    for /f "tokens=1-3 delims=/ " %%a in ('date /t') do set d=%%a-%%b-%%c
    for /f "tokens=1-2 delims=: " %%a in ('time /t') do set t=%%a:%%b
    git commit -m "Auto-update %d% %t%"
    git push origin main
    echo [%d% %t%] Wijzigingen gepusht!
) else (
    echo [%time:~0,5%] Geen wijzigingen gevonden.
)
goto loop
