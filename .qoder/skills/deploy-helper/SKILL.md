---
name: deploy-helper
description: Deploy web projects to GitHub Pages or Vercel with automated Git operations, build configuration, and production deployment. Use when user wants to deploy a website, publish static files, configure CI/CD, or set up continuous deployment. Includes Git status detection, commit prompts, and push automation.
---

# 部署助手 | Deploy Helper

帮助你快速将Web项目部署到GitHub Pages或Vercel，包含Git状态检测、自动提交提示和推送功能。

## 🚀 快速开始

### 1. 检查Git状态

在部署前，首先检查当前Git状态：

```bash
git status
```

**关键检查点**：
- ✅ 是否有未提交的更改？
- ✅ 是否在正确的分支（main/master）？
- ✅ 是否已关联远程仓库？

### 2. 提交待更改的文件

如果有未提交的更改，先提交：

```bash
# 添加所有修改的文件
git add .

# 或者只添加特定文件
git add index.html README.md

# 提交更改
git commit -m "feat: 添加了图像识别功能"
```

**提交信息规范**：
- `feat:` - 新功能
- `fix:` - 修复bug
- `docs:` - 文档更新
- `style:` - 代码格式调整
- `refactor:` - 重构
- `test:` - 测试相关
- `chore:` - 构建/工具相关

### 3. 推送到GitHub

```bash
# 首次推送（需要设置上游分支）
git push -u origin main

# 后续推送
git push
```

---

## 📦 部署到 GitHub Pages

### 方法一：使用 gh-pages 分支（推荐用于静态站点）

#### 步骤1：安装 gh-pages 工具

```bash
npm install -g gh-pages
```

#### 步骤2：配置 package.json（如果有）

```json
{
  "scripts": {
    "deploy": "gh-pages -d ."
  }
}
```

#### 步骤3：执行部署

```bash
# 如果使用 npm
npm run deploy

# 或者直接运行
gh-pages -d .
```

这会将当前目录的所有文件推送到 `gh-pages` 分支，GitHub会自动将其作为Pages站点发布。

#### 步骤4：启用 GitHub Pages

1. 访问你的GitHub仓库
2. 点击 **Settings** → **Pages**
3. 在 **Branch** 下拉菜单中选择 `gh-pages`
4. 点击 **Save**
5. 等待几分钟，访问 `https://你的用户名.github.io/仓库名`

### 方法二：手动部署到 gh-pages 分支

```bash
# 1. 创建并切换到 gh-pages 分支
git checkout --orphan gh-pages

# 2. 删除所有现有文件（保留.git文件夹）
git rm -rf .

# 3. 复制需要部署的文件
cp ../index.html .
cp ../README.md .
# 复制其他需要的文件...

# 4. 添加并提交
git add .
git commit -m "Deploy to GitHub Pages"

# 5. 推送到远程
git push -u origin gh-pages

# 6. 切换回主分支
git checkout main
```

---

## ☁️ 部署到 Vercel

### 方法一：使用 Vercel CLI（推荐）

#### 步骤1：安装 Vercel CLI

```bash
npm install -g vercel
```

#### 步骤2：登录 Vercel

```bash
vercel login
```

按照提示选择登录方式（GitHub/GitLab/Bitbucket/Email）。

#### 步骤3：部署项目

```bash
# 在项目根目录运行
vercel
```

首次部署时会询问：
- **Set up and deploy?** → Yes
- **Which scope?** → 选择你的账户
- **Link to existing project?** → No（首次）
- **What's your project's name?** → 输入项目名称
- **In which directory is your code located?** → ./
- **Want to override the settings?** → No

#### 步骤4：生产环境部署

```bash
# 部署到生产环境
vercel --prod
```

#### 步骤5：查看部署结果

部署完成后，Vercel会提供一个URL，例如：
```
https://your-project.vercel.app
```

### 方法二：通过 GitHub 集成（自动部署）

#### 步骤1：在 Vercel 上导入项目

1. 访问 [vercel.com](https://vercel.com)
2. 点击 **Add New Project**
3. 选择 **Import Git Repository**
4. 选择你的GitHub仓库
5. 点击 **Import**

#### 步骤2：配置构建设置

- **Framework Preset**: Other（如果是纯HTML）
- **Build Command**: 留空（纯HTML无需构建）
- **Output Directory**: . （当前目录）
- **Install Command**: 留空

#### 步骤3：部署

点击 **Deploy**，Vercel会自动从GitHub拉取代码并部署。

#### 步骤4：启用自动部署

每次你推送到GitHub的main分支时，Vercel会自动重新部署！

---

## 🔧 Git 操作自动化脚本

### 检查并提示未提交的更改

创建一个辅助脚本来检查Git状态：

**scripts/check-git-status.sh** (Linux/Mac):
```bash
#!/bin/bash

echo "🔍 检查 Git 状态..."

# 检查是否有未提交的更改
if [[ -n $(git status -s) ]]; then
    echo "⚠️  发现未提交的更改："
    git status -s
    
    read -p "是否要提交这些更改？(y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        read -p "请输入提交信息: " commit_msg
        git add .
        git commit -m "$commit_msg"
        echo "✅ 提交成功！"
        
        read -p "是否推送到远程仓库？(y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            git push
            echo "✅ 推送成功！"
        fi
    fi
else
    echo "✅ 没有未提交的更改"
fi

# 检查是否在正确的分支
current_branch=$(git branch --show-current)
echo "📍 当前分支: $current_branch"

if [[ "$current_branch" != "main" && "$current_branch" != "master" ]]; then
    echo "⚠️  警告：你可能不在 main/master 分支上"
fi
```

**scripts/check-git-status.bat** (Windows):
```batch
@echo off
echo 🔍 检查 Git 状态...

git status -s > temp_status.txt

findstr /R "." temp_status.txt >nul
if %errorlevel%==0 (
    echo ⚠️  发现未提交的更改：
    type temp_status.txt
    
    set /p confirm="是否要提交这些更改？(y/n) "
    if /i "%confirm%"=="y" (
        set /p commit_msg="请输入提交信息: "
        git add .
        git commit -m "%commit_msg%"
        echo ✅ 提交成功！
        
        set /p push_confirm="是否推送到远程仓库？(y/n) "
        if /i "%push_confirm%"=="y" (
            git push
            echo ✅ 推送成功！
        )
    )
) else (
    echo ✅ 没有未提交的更改
)

del temp_status.txt

for /f "tokens=*" %%i in ('git branch --show-current') do set current_branch=%%i
echo 📍 当前分支: %current_branch%
```

使用方法：
```bash
# Linux/Mac
chmod +x scripts/check-git-status.sh
./scripts/check-git-status.sh

# Windows
scripts\check-git-status.bat
```

---

## 📋 部署前检查清单

在部署之前，确保完成以下检查：

### 代码质量
- [ ] 所有功能测试通过
- [ ] 没有控制台错误（Console Errors）
- [ ] 响应式设计在移动端正常显示
- [ ] 所有链接正常工作

### Git 状态
- [ ] 所有更改已提交
- [ ] 已推送到远程仓库
- [ ] 在正确的分支（main/master）

### 配置文件
- [ ] README.md 已更新
- [ ] .gitignore 正确配置（不包含敏感文件）
- [ ] LICENSE 文件已添加（如果是开源项目）

### 安全性
- [ ] 没有硬编码的API密钥或密码
- [ ] .env 文件已添加到 .gitignore
- [ ] 敏感信息已移除

---

## 🔄 持续部署工作流

### GitHub Actions 自动部署示例

创建 `.github/workflows/deploy.yml`：

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: .
          keep_files: true
```

这个工作流会在每次推送到main分支时自动部署到GitHub Pages。

---

## ❓ 常见问题

### Q1: GitHub Pages 部署后页面显示404
**解决方法**：
1. 检查是否在 Settings → Pages 中选择了正确的分支
2. 确认 index.html 在仓库根目录
3. 等待几分钟让GitHub处理部署
4. 检查浏览器控制台是否有错误

### Q2: Vercel 部署失败
**解决方法**：
1. 检查构建日志中的错误信息
2. 确认输出目录配置正确
3. 如果是纯HTML项目，确保 Build Command 留空
4. 检查是否有不支持的文件类型

### Q3: 如何自定义域名？
**GitHub Pages**：
1. 在仓库根目录创建 `CNAME` 文件，内容为你的域名
2. 在DNS服务商处添加CNAME记录指向 `你的用户名.github.io`
3. 在 Settings → Pages → Custom domain 中输入域名

**Vercel**：
1. 在项目设置中添加自定义域名
2. 按照Vercel提供的DNS配置说明操作
3. 等待DNS传播（通常几分钟到几小时）

### Q4: 如何回滚到之前的版本？
**GitHub Pages**：
```bash
# 找到要回滚的提交哈希
git log --oneline

# 重置到该提交
git reset --hard <commit-hash>

# 强制推送（谨慎使用）
git push -f origin gh-pages
```

**Vercel**：
1. 在 Vercel Dashboard 中找到之前的部署
2. 点击 **Promote to Production**

---

## 🎯 最佳实践

1. **始终在部署前测试本地构建**
2. **使用语义化的提交信息**
3. **保持 .gitignore 最新**
4. **定期检查依赖更新**
5. **监控部署后的网站性能**
6. **设置自定义域名提升专业性**
7. **启用HTTPS（GitHub Pages和Vercel默认提供）**

---

## 📚 相关资源

- [GitHub Pages 官方文档](https://docs.github.com/en/pages)
- [Vercel 官方文档](https://vercel.com/docs)
- [Git 官方文档](https://git-scm.com/doc)
- [GitHub Actions 文档](https://docs.github.com/en/actions)

---

**最后更新**：2026年6月
