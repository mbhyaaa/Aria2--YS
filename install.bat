@echo off

REM 设置编码格式为 UTF-8
chcp 65001 >nul

REM 检查是否以管理员身份运行
fltmc >nul 2>&1 || (
    echo 请以管理员身份运行此脚本！
    pause >nul
    exit /b
)

REM 定义脚本所在目录
set CURRENT_DIR=%~dp0

REM 创建 Aria2 服务，并设置开机自动运行

echo [1/3]创建 Aria2 服务...
"%CURRENT_DIR%shawl.exe" add --no-log-cmd --name Aria2Service --cwd "%CURRENT_DIR%." -- "%CURRENT_DIR%aria2c.exe" --conf-path=aria2.conf

echo [2/3]设置 Aria2 服务开机自动运行...
sc config Aria2Service start= auto >nul

echo [3/3]启动 Aria2 服务...
sc start Aria2Service >nul

echo 执行完毕，按任意键退出...
pause >nul
