@echo off
REM =====================================================================
REM 学校公告站点 - Windows 快速定制化工具
REM =====================================================================
REM
REM 用途：在 Windows 上为不同学校快速生成定制化的公告站点
REM
REM 使用方法：
REM   1. 右键点击此文件，选择"编辑"
REM   2. 修改 SCHOOL_NAME 和 PRIMARY_COLOR
REM   3. 保存并双击运行
REM
REM 示例配置：
REM   SCHOOL_NAME=第一中学
REM   PRIMARY_COLOR=#ef4444
REM   DESCRIPTION=第一中学官方公告站
REM
REM =====================================================================

setlocal enabledelayedexpansion

REM =============== 可修改配置 ===============
set SCHOOL_NAME=示范中学
set PRIMARY_COLOR=#3b82f6
set DESCRIPTION=示范中学官方公告站
REM ==========================================

echo.
echo =====================================================================
echo   学校公告站点定制化工具 (Windows)
echo =====================================================================
echo.
echo   学校名称: %SCHOOL_NAME%
echo   主色代码: %PRIMARY_COLOR%
echo   学校描述: %DESCRIPTION%
echo.

REM 创建输出目录
set OUTPUT_DIR=output\%SCHOOL_NAME%
if exist "%OUTPUT_DIR%" (
    echo.
    echo 目录已存在，覆盖中...
    rmdir /s /q "%OUTPUT_DIR%"
)

mkdir "%OUTPUT_DIR%\assets\images"
echo. [✓] 创建目录完成

REM 复制文件
for %%F in (*.html styles.css README.md) do (
    if exist "%%F" (
        copy "%%F" "%OUTPUT_DIR%\%%F" >nul
    )
)
echo. [✓] 文件复制完成

REM 替换 HTML 文件中的文本
setlocal enabledelayedexpansion
for %%F in (%OUTPUT_DIR%\*.html) do (
    call :replaceInFile "%%F"
)

REM 创建配置文件
(
    echo {
    echo   "schoolName": "%SCHOOL_NAME%",
    echo   "primaryColor": "%PRIMARY_COLOR%",
    echo   "description": "%DESCRIPTION%",
    echo   "createdAt": "!date! !time!",
    echo   "version": "1.0"
    echo }
) > "%OUTPUT_DIR%\config.json"
echo. [✓] 配置文件创建完成

echo.
echo =====================================================================
echo   [✓] 定制化完成！
echo =====================================================================
echo.
echo 📁 输出位置: %OUTPUT_DIR%
echo.
echo 下一步操作：
echo   1. 打开文件夹: start %OUTPUT_DIR%
echo   2. 双击 index.html 预览效果
echo   3. 根据需要修改公告示例数据
echo   4. 上传到服务器部署
echo.

REM 询问是否打开文件夹
set /p OPEN="是否现在打开输出文件夹? (Y/N): "
if /i "%OPEN%"=="Y" (
    start "%OUTPUT_DIR%"
)

goto :end

REM =============== 文本替换函数 ===============
:replaceInFile
setlocal enabledelayedexpansion
set "file=%~1"

REM 创建临时文件
set "tempfile=%file%.tmp"

(
    for /f "usebackq delims=" %%A in ("%file%") do (
        set "line=%%A"
        set "line=!line:示范中学=%SCHOOL_NAME%!"
        set "line=!line:#3b82f6=%PRIMARY_COLOR%!"
        set "line=!line:学校官方公告=%DESCRIPTION%!"
        echo !line!
    )
) > "%tempfile%"

REM 替换原文件
move /y "%tempfile%" "%file%" >nul

endlocal
exit /b

:end
echo.
echo 按任意键退出...
pause >nul
