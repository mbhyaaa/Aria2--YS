@echo off
REM 设置编码格式为 UTF-8
chcp 65001 >nul

REM 检查是否以管理员身份运行
fltmc >nul 2>&1 || (
    echo 请以管理员身份运行此脚本！
    pause >nul
    exit /b
)

REM 停止并删除 Aria2 服务

echo [1/2]停止 Aria2 服务...
sc stop Aria2Service >nul

echo [2/2]删除 Aria2 服务...
sc delete Aria2Service >nul

echo 执行完毕，按任意键退出...
pause >nul