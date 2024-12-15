@echo off
setlocal enabledelayedexpansion

set "parent_dir=%~1"
set "m3u_file=%~2"

set "download_folder=%parent_dir%\%~n2"

if not exist "%download_folder%" mkdir "%download_folder%"

set /a count=0

for /f "delims=" %%a in ('findstr /i "https" "%m3u_file%"') do (
    set /a count+=1
    set "url!count!=%%a"
    set "filename!count!=%%~nxa"
)

for /l %%a in (1,1,!count!) do (
    set "file_path=%download_folder%\!filename%%a!"
    if not exist "!file_path!" (
        echo Downloading !url%%a!...
        curl -L -o "!file_path!" "!url%%a!"
        echo Downloaded !url%%a!
        goto :end
    ) else (
        echo Skipping !url%%a! (file already exists)
    )
)

:end
