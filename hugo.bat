@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "DEFAULT_PUBLIC_DIR=public"

if "%~1"=="" goto :help

set "MODE=%~1"
shift

rem Optional "--" separator (ignored)
if "%~1"=="--" shift

rem Ensure hugo exists
where hugo.exe >nul 2>&1
if errorlevel 1 (
  echo Error: required command not found: hugo
  exit /b 127
)

if /I "%MODE%"=="dev" goto :dev
if /I "%MODE%"=="prod" goto :prod
if /I "%MODE%"=="build" goto :prod
if /I "%MODE%"=="production" goto :prod
if /I "%MODE%"=="clean" goto :clean
if /I "%MODE%"=="help" goto :help
if /I "%MODE%"=="-h" goto :help
if /I "%MODE%"=="--help" goto :help

echo Error: unknown mode: %MODE%
echo.
goto :help_exit2

:dev
call hugo clean
rem Pass remaining args directly to hugo server
hugo.exe server --cleanDestinationDir --watch --forceSyncStatic --buildExpired --buildDrafts --buildFuture --disableFastRender --navigateToChanged --poll 700ms -D %*
exit /b %errorlevel%

:prod
rem Pass remaining args directly to hugo build
hugo.exe --templateMetrics --templateMetricsHints --cleanDestinationDir --minify %*
exit /b %errorlevel%

:clean
set "PUBLIC_DIR=%~1"
if "%PUBLIC_DIR%"=="" set "PUBLIC_DIR=%DEFAULT_PUBLIC_DIR%"

rem Basic safety checks
if "%PUBLIC_DIR%"=="/" (
  echo Refusing to clean unsafe directory: "%PUBLIC_DIR%"
  exit /b 1
)
if "%PUBLIC_DIR%"=="\" (
  echo Refusing to clean unsafe directory: "%PUBLIC_DIR%"
  exit /b 1
)
if "%PUBLIC_DIR%"=="" (
  echo Refusing to clean unsafe directory: "%PUBLIC_DIR%"
  exit /b 1
)

echo Cleaning Hugo output and cache...
if exist "%PUBLIC_DIR%" rmdir /s /q "%PUBLIC_DIR%"
if exist "resources\_gen" rmdir /s /q "resources\_gen"

rem Best effort: Hugo GC (ignore failure)
hugo.exe --gc --cleanDestinationDir >nul 2>&1

echo Clean completed.
exit /b 0

:help
echo.
echo Hugo framework helper script
echo.
echo USAGE:
echo   hugo.bat dev    [--] [extra hugo server args...]
echo   hugo.bat prod   [--] [extra hugo build args...]
echo   hugo.bat clean  [public_dir]
echo   hugo.bat help
echo.
echo MODES:
echo   dev     Run Hugo development server with file watching ^& live reload.
echo   prod    Build production site output (ready to deploy).
echo   clean   Remove generated output and Hugo cache.
echo   help    Show this help text.
echo.
echo EXAMPLES:
echo   hugo.bat dev
echo   hugo.bat dev -- -D --port 1314
echo   hugo.bat prod
echo   hugo.bat prod -- --minify --gc
echo   hugo.bat clean
echo   hugo.bat clean public
echo.

exit /b 0

:help_exit2
call :help
exit /b 2

