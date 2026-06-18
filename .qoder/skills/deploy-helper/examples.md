# 部署助手使用示例

## 示例1：部署纯HTML静态站点到GitHub Pages

**场景**：你有一个单页应用（如防震问答机器人），想要部署到GitHub Pages。

### 步骤

```bash
# 1. 检查Git状态
git status

# 输出示例：
# On branch main
# Your branch is up to date with 'origin/main'.
# Changes not staged for commit:
#   modified:   index.html

# 2. 提交更改
git add index.html
git commit -m "feat: 添加了图像识别功能"

# 3. 推送到GitHub
git push

# 4. 安装 gh-pages（如果还没安装）
npm install -g gh-pages

# 5. 部署到 gh-pages 分支
gh-pages -d .

# 6. 在 GitHub 上启用 Pages
# 访问 https://github.com/你的用户名/仓库名/settings/pages
# 选择 gh-pages 分支，点击 Save

# 7. 访问部署后的网站
# https://你的用户名.github.io/仓库名
```

---

## 示例2：使用 Vercel CLI 部署

**场景**：你想快速部署到Vercel并获得免费的HTTPS和CDN。

### 步骤

```bash
# 1. 安装 Vercel CLI
npm install -g vercel

# 2. 登录 Vercel
vercel login
# 按照提示选择 GitHub 登录

# 3. 在项目根目录运行
cd "C:\Users\26303\Downloads\AI问答机器人"
vercel

# 首次部署时的交互：
# ? Set up and deploy "~/Downloads/AI问答机器人"? [Y/n] → Y
# ? Which scope do you want to deploy to? → 选择你的账户
# ? Link to existing project? [y/N] → N
# ? What's your project's name? → earthquake-prevention-bot
# ? In which directory is your code located? [./] → ./
# ? Want to override the settings? [y/N] → N

# 4. 等待部署完成
# ✅ Deployment complete!
# https://earthquake-prevention-bot.vercel.app

# 5. 生产环境部署
vercel --prod
```

---

## 示例3：配置自动部署工作流

**场景**：你希望每次推送到GitHub时自动部署。

### 创建 GitHub Actions 工作流

创建文件 `.github/workflows/deploy.yml`：

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
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Build
        run: npm run build
      
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./dist
```

### 使用方法

```bash
# 1. 提交工作流文件
git add .github/workflows/deploy.yml
git commit -m "ci: 添加自动部署工作流"
git push

# 2. 之后每次推送都会自动部署
git add index.html
git commit -m "fix: 修复移动端布局问题"
git push
# GitHub Actions 会自动运行并部署
```

---

## 示例4：检查Git状态并智能提示

**场景**：你想在部署前确保所有更改已提交。

### 使用辅助脚本

```bash
# Linux/Mac
./scripts/check-git-status.sh

# 输出示例：
# 🔍 检查 Git 状态...
# ⚠️  发现未提交的更改：
#  M index.html
#  M README.md
# 是否要提交这些更改？(y/n) y
# 请输入提交信息: feat: 更新了README文档
# ✅ 提交成功！
# 是否推送到远程仓库？(y/n) y
# ✅ 推送成功！
# 📍 当前分支: main
```

### 手动检查

```bash
# 1. 查看Git状态
git status

# 2. 如果有未提交的更改
git diff  # 查看具体改动

# 3. 决定是否需要提交
git add .
git commit -m "docs: 更新部署文档"

# 4. 推送到远程
git push
```

---

## 示例5：回滚到之前的版本

**场景**：部署后发现bug，需要快速回滚。

### GitHub Pages 回滚

```bash
# 1. 查看提交历史
git log --oneline gh-pages

# 输出示例：
# abc1234 (HEAD -> gh-pages) Deploy: latest version
# def5678 Deploy: previous stable version
# ghi9012 Deploy: old version

# 2. 重置到稳定版本
git checkout gh-pages
git reset --hard def5678

# 3. 强制推送（谨慎使用）
git push -f origin gh-pages

# 4. 验证回滚成功
# 访问 https://你的用户名.github.io/仓库名
```

### Vercel 回滚

1. 访问 [vercel.com](https://vercel.com/dashboard)
2. 选择你的项目
3. 在 **Deployments** 标签中找到之前的部署
4. 点击 **...** → **Promote to Production**

---

## 示例6：配置自定义域名

**场景**：你想使用自己的域名而不是默认的 `.github.io` 或 `.vercel.app`。

### GitHub Pages 自定义域名

```bash
# 1. 在仓库根目录创建 CNAME 文件
echo "your-domain.com" > CNAME

# 2. 提交并推送
git add CNAME
git commit -m "chore: 添加自定义域名配置"
git push

# 3. 在DNS服务商处添加记录
# 类型: CNAME
# 名称: www（或 @）
# 值: 你的用户名.github.io

# 4. 在 GitHub Settings → Pages → Custom domain 中输入域名
# 5. 勾选 "Enforce HTTPS"
```

### Vercel 自定义域名

1. 在 Vercel Dashboard 中选择项目
2. 进入 **Settings** → **Domains**
3. 添加你的域名
4. 按照提示配置DNS记录
5. 等待验证通过（通常几分钟）

---

## 示例7：多环境部署

**场景**：你有开发环境和生产环境，需要分别部署。

### 使用 Vercel 的环境变量

```bash
# 1. 设置环境变量
vercel env add API_URL production
# 输入生产环境的API URL

vercel env add API_URL development
# 输入开发环境的API URL

# 2. 部署到不同环境
vercel  # 部署到预览环境
vercel --prod  # 部署到生产环境

# 3. 在代码中使用环境变量
// JavaScript
const apiUrl = process.env.API_URL || 'https://api.example.com';
```

### GitHub Pages 的多分支策略

```bash
# 开发分支部署到 dev 子目录
git checkout develop
gh-pages -d . -b gh-pages-dev

# 主分支部署到根目录
git checkout main
gh-pages -d . -b gh-pages
```

---

## 示例8：部署后验证

**场景**：部署后需要验证网站正常工作。

### 自动化验证脚本

创建 `scripts/verify-deployment.sh`：

```bash
#!/bin/bash

URL="https://你的用户名.github.io/仓库名"

echo "🔍 验证部署..."

# 检查HTTP状态码
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$STATUS" -eq 200 ]; then
    echo "✅ 网站可访问 (HTTP $STATUS)"
else
    echo "❌ 网站不可访问 (HTTP $STATUS)"
    exit 1
fi

# 检查关键内容是否存在
if curl -s "$URL" | grep -q "防震问答机器人"; then
    echo "✅ 关键内容存在"
else
    echo "❌ 关键内容缺失"
    exit 1
fi

# 检查响应时间
RESPONSE_TIME=$(curl -s -o /dev/null -w "%{time_total}" "$URL")
echo "⏱️  响应时间: ${RESPONSE_TIME}s"

if (( $(echo "$RESPONSE_TIME < 2" | bc -l) )); then
    echo "✅ 响应时间正常"
else
    echo "⚠️  响应时间较慢"
fi

echo "✅ 部署验证通过！"
```

使用方法：
```bash
chmod +x scripts/verify-deployment.sh
./scripts/verify-deployment.sh
```

---

## 最佳实践总结

1. **始终在部署前测试本地构建**
2. **使用语义化的提交信息**
3. **保持 .gitignore 最新**
4. **定期检查依赖更新**
5. **监控部署后的网站性能**
6. **设置自定义域名提升专业性**
7. **启用HTTPS（默认提供）**
8. **配置自动部署节省时间**
9. **保留部署日志便于排查问题**
10. **定期备份重要数据**

---

**提示**：根据你的项目类型和需求，选择最适合的部署方式。对于纯HTML静态站点，GitHub Pages是简单免费的选择；对于需要更多功能和更好性能的项目，Vercel是更好的选择。
