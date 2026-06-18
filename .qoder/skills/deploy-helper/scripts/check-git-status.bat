@echo off
setlocal enabledelayedexpansion

:: Git状态检查脚本 (Windows版本)
:: 用途：检查Git状态，提示未提交的更改，并提供提交和推送选项

echo 🔍 检查 Git 状态...
echo.

:: 检查是否在Git仓库中
git rev-parse --is-inside-work-tree >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ 错误：当前目录不是Git仓库
    exit /b 1
)

:: 获取当前分支
for /f "tokens=*" %%i in ('git branch --show-current') do set current_branch=%%i
echo 📍 当前分支: %current_branch%
echo.

:: 检查是否有未提交的更改
git status -s > temp_status.txt

findstr /R "." temp_status.txt >nul
if %errorlevel%==0 (
    echo ⚠️  发现未提交的更改：
    echo.
    
    :: 读取并显示状态
    for /f "tokens=*" %%a in (temp_status.txt) do (
        set line=%%a
        set status=!line:~0,2!
        set file=!line:~3!
        
        if "!status!"==" M" echo    已修改: !file!
        if "!status!"=="M " echo    已暂存: !file!
        if "!status!"=="??" echo   ❓ 未跟踪: !file!
        if "!status!"==" D" echo   ️  已删除: !file!
        if "!status!"=="R " echo   🔄 已重命名: !file!
    )
    
    echo.
    set /p confirm="是否要提交这些更改？(y/n) "
    
    if /i "%confirm%"=="y" (
        echo.
        
        :: 询问是否添加所有文件
        set /p add_all="是否添加所有更改的文件？(y/n) "
        
        if /i "!add_all!"=="y" (
            git add .
            echo ✅ 已添加所有文件到暂存区
        ) else (
            echo.
            echo 请手动运行以下命令添加文件：
            echo   git add ^<文件名^>
            echo.
            pause
        )
        
        :: 获取提交信息
        echo.
        set /p commit_msg="请输入提交信息: "
        
        if "!commit_msg!"=="" (
            echo  提交信息不能为空
            del temp_status.txt
            exit /b 1
        )
        
        :: 提交更改
        git commit -m "!commit_msg!"
        echo ✅ 提交成功！
        
        :: 询问是否推送
        echo.
        set /p push_confirm="是否推送到远程仓库？(y/n) "
        
        if /i "!push_confirm!"=="y" (
            git push
            echo ✅ 推送成功！
        )
    ) else (
        echo.
        echo ⏭️  跳过提交，你可以稍后手动提交
    )
) else (
    echo.
    echo ✅ 没有未提交的更改
)

del temp_status.txt

:: 检查与远程同步状态
echo.
echo 🔄 检查与远程仓库的同步状态...

git fetch origin >nul 2>&1

for /f "tokens=*" %%i in ('git rev-parse HEAD') do set local_commit=%%i

:: 尝试获取远程提交
git rev-parse @{u} >nul 2>&1
if %errorlevel%==0 (
    for /f "tokens=*" %%i in ('git rev-parse @{u}') do set remote_commit=%%i
    
    if "!local_commit!"=="!remote_commit!" (
        echo ✅ 本地与远程同步
    ) else (
        echo ⚠️  本地与远程不同步
    )
) else (
    echo ⚠️  尚未设置上游分支
)

:: 显示最近的提交记录
echo.
echo  最近3次提交：
git log --oneline -3

echo.
echo ✨ 检查完成！

endlocal
