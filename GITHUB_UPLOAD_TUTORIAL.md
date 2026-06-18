# GitHub 上传教程 - 防震问答机器人

本教程将指导您如何将项目代码上传到 GitHub。

##  前置准备

### 1. 注册 GitHub 账号（如果还没有）
1. 访问 [https://github.com](https://github.com)
2. 点击 "Sign up" 注册账号
3. 验证邮箱

### 2. 安装 Git（如果还没安装）
- **Windows**: 下载并安装 [Git for Windows](https://git-scm.com/download/win)
- **Mac**: 运行 `brew install git` 或从 [官网](https://git-scm.com/download/mac) 下载
- **Linux**: 运行 `sudo apt-get install git` (Ubuntu/Debian) 或相应命令

### 3. 配置 Git（首次使用）
打开终端（Terminal）或命令行（Command Prompt），运行：
```bash
git config --global user.name "你的名字"
git config --global user.email "你的邮箱@example.com"
```

---

##  上传步骤

### 方法一：使用 Git 命令行（推荐）

#### 第1步：进入项目目录
```bash
cd "C:\Users\26303\Downloads\AI问答机器人"
```

#### 第2步：初始化 Git 仓库（如果还未初始化）
```bash
git init
git branch -m main
```

#### 第3步：添加文件到暂存区
```bash
git add index.html README.md .gitignore
```

如果要添加所有文件：
```bash
git add .
```

#### 第4步：提交更改
```bash
git commit -m "Initial commit: Earthquake Prevention Q&A Bot with image recognition feature"
```

#### 第5步：在 GitHub 上创建新仓库

1. 登录 [GitHub](https://github.com)
2. 点击右上角的 "+" 号，选择 "New repository"
3. 填写仓库信息：
   - **Repository name**: `earthquake-prevention-bot`（或其他你喜欢的名字）
   - **Description**（可选）: `Earthquake prevention Q&A bot with precursor identification, historical cases, and emergency guide`
   - **Visibility**: 选择 "Public"（公开）或 "Private"（私有）
   - **不要勾选** "Add a README file"（因为我们已经有了）
4. 点击 "Create repository"

#### 第6步：关联远程仓库并推送

复制 GitHub 显示的命令（类似下面）：

```bash
# 添加远程仓库（替换为你自己的仓库URL）
git remote add origin https://github.com/你的用户名/earthquake-prevention-bot.git

# 推送到 GitHub
git push -u origin main
```

**完整示例**（假设你的用户名是 `zhangsan`）：
```bash
git remote add origin https://github.com/zhangsan/earthquake-prevention-bot.git
git push -u origin main
```

#### 第7步：验证上传成功
刷新 GitHub 仓库页面，你应该能看到所有文件已经上传成功！

---

### 方法二：使用 GitHub Desktop（图形界面，适合新手）

#### 第1步：下载并安装 GitHub Desktop
访问 [https://desktop.github.com](https://desktop.github.com) 下载并安装

#### 第2步：登录 GitHub Desktop
1. 打开 GitHub Desktop
2. 使用你的 GitHub 账号登录

#### 第3步：添加本地仓库
1. 点击 "File" → "Add local repository..."
2. 选择项目文件夹：`C:\Users\26303\Downloads\AI问答机器人`
3. 如果提示 "This directory does not appear to be a Git repository"，点击 "create a repository"

#### 第4步：提交更改
1. 在左下角的 "Summary" 输入框中输入提交信息，例如：`Initial commit: Earthquake Prevention Q&A Bot`
2. 点击 "Commit to main"

#### 第5步：发布到 GitHub
1. 点击顶部的 "Publish repository" 按钮
2. 填写仓库名称和描述
3. 选择 "Public" 或 "Private"
4. 点击 "Publish Repository"

完成！你的代码已经上传到 GitHub 了。

---

##  后续更新代码

当你修改了代码后，需要再次上传：

### 使用命令行：
```bash
# 查看哪些文件被修改
git status

# 添加修改的文件
git add index.html  # 或者 git add . 添加所有修改

# 提交更改
git commit -m "Update: 添加了新的前兆识别功能"

# 推送到 GitHub
git push
```

### 使用 GitHub Desktop：
1. 修改文件后，GitHub Desktop 会自动检测到变化
2. 在左下角输入提交信息
3. 点击 "Commit to main"
4. 点击 "Push origin" 推送到 GitHub

---

## ❓ 常见问题

### Q1: 推送时出现 "Permission denied" 错误
**解决方法**：
- 确保你已登录正确的 GitHub 账号
- 检查仓库 URL 是否正确
- 如果是私有仓库，确保你有写入权限

### Q2: 推送时出现 "Updates were rejected" 错误
**解决方法**：
```bash
# 先拉取远程更改
git pull origin main

# 解决冲突（如果有）
# 然后再次推送
git push
```

### Q3: 忘记添加 .gitignore 导致上传了很多不需要的文件
**解决方法**：
```bash
# 1. 先从 Git 中移除这些文件（但保留本地文件）
git rm -r --cached node_modules/
git rm -r --cached *.tmp

# 2. 确保 .gitignore 已正确配置
# 3. 提交更改
git commit -m "Remove unnecessary files from repository"

# 4. 推送
git push
```

### Q4: 如何查看上传历史？
在 GitHub 仓库页面，点击 "Commits" 标签，可以看到所有提交记录。

### Q5: 如何下载别人上传的代码？
```bash
git clone https://github.com/用户名/仓库名.git
```

---

## 🎉 恭喜！

你已经成功将防震问答机器人上传到 GitHub！现在你可以：
- ✅ 与他人分享你的项目
- ✅ 在不同设备上同步代码
- ✅ 接收他人的反馈和建议
- ✅ 展示你的开发成果

### 下一步建议：
1. 在 README.md 中添加项目的在线演示链接（如果部署到网上）
2. 添加 LICENSE 文件（选择合适的开源许可证）
3. 设置 GitHub Pages 进行在线演示（可选）
4. 邀请协作者共同开发（如果需要）

---

**需要帮助？**
如果在上传过程中遇到任何问题，可以：
- 查看 [GitHub 官方文档](https://docs.github.com)
- 在项目的 Issues 中提问
- 搜索相关错误信息

祝你使用愉快！
