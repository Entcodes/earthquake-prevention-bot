#!/bin/bash

# Git状态检查脚本
# 用途：检查Git状态，提示未提交的更改，并提供提交和推送选项

echo "🔍 检查 Git 状态..."
echo ""

# 检查是否在Git仓库中
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "❌ 错误：当前目录不是Git仓库"
    exit 1
fi

# 获取当前分支
current_branch=$(git branch --show-current)
echo "📍 当前分支: $current_branch"

# 检查是否有未提交的更改
uncommitted=$(git status -s)

if [[ -n "$uncommitted" ]]; then
    echo ""
    echo "⚠️  发现未提交的更改："
    echo ""
    git status -s | while read -r line; do
        status="${line:0:2}"
        file="${line:3}"
        
        case "$status" in
            " M") echo "   已修改: $file" ;;
            "M ") echo "   已暂存: $file" ;;
            "??") echo "  ❓ 未跟踪: $file" ;;
            " D") echo "  🗑️  已删除: $file" ;;
            "R ") echo "  🔄 已重命名: $file" ;;
            *)   echo "   $status: $file" ;;
        esac
    done
    
    echo ""
    read -p "是否要提交这些更改？(y/n) " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo ""
        
        # 询问是否添加所有文件
        read -p "是否添加所有更改的文件？(y/n) " -n 1 -r
        echo
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            git add .
            echo "✅ 已添加所有文件到暂存区"
        else
            echo ""
            echo "请手动运行以下命令添加文件："
            echo "  git add <文件名>"
            echo ""
            read -p "按回车继续..." 
        fi
        
        # 获取提交信息
        echo ""
        read -p "请输入提交信息: " commit_msg
        
        if [[ -z "$commit_msg" ]]; then
            echo "❌ 提交信息不能为空"
            exit 1
        fi
        
        # 提交更改
        git commit -m "$commit_msg"
        echo "✅ 提交成功！"
        
        # 询问是否推送
        echo ""
        read -p "是否推送到远程仓库？(y/n) " -n 1 -r
        echo
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            # 检查是否已设置上游分支
            upstream=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
            
            if [[ -z "$upstream" ]]; then
                echo "⚠️  尚未设置上游分支，将使用: origin/$current_branch"
                git push -u origin "$current_branch"
            else
                git push
            fi
            
            echo "✅ 推送成功！"
        fi
    else
        echo ""
        echo "⏭️  跳过提交，你可以稍后手动提交"
    fi
else
    echo ""
    echo "✅ 没有未提交的更改"
fi

# 检查是否与远程同步
echo ""
echo "🔄 检查与远程仓库的同步状态..."

git fetch origin > /dev/null 2>&1

local_commit=$(git rev-parse HEAD)
remote_commit=$(git rev-parse @{u} 2>/dev/null || echo "")

if [[ -n "$remote_commit" ]]; then
    if [[ "$local_commit" == "$remote_commit" ]]; then
        echo "✅ 本地与远程同步"
    elif [[ $(git merge-base HEAD @{u}) == "$remote_commit" ]]; then
        ahead_count=$(git rev-list --count HEAD...@{u})
        echo "️  本地领先远程 $ahead_count 个提交（需要推送）"
    elif [[ $(git merge-base HEAD @{u}) == "$local_commit" ]]; then
        behind_count=$(git rev-list --count @{u}...HEAD)
        echo "️  本地落后远程 $behind_count 个提交（需要拉取）"
    else
        echo "⚠️  本地和远程有分歧（需要先合并）"
    fi
fi

# 显示最近的提交记录
echo ""
echo " 最近3次提交："
git log --oneline -3

echo ""
echo "✨ 检查完成！"
