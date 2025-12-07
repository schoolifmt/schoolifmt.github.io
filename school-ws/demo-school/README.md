# 学校公告站点 - 部署与配置指南

## 📋 项目概述

这是一套现代化的学校公告发布站点，采用毛玻璃（Glassmorphism）设计风格，提供完整的公告管理和展示功能。

### 核心特性
- ✅ **毛玻璃设计**：现代、高级的视觉效果
- ✅ **响应式布局**：完美适配移动、平板、桌面设备
- ✅ **无缝集成**：使用 Tailwind CSS CDN + 自定义 CSS
- ✅ **可访问性**：遵循 WCAG 标准，支持键盘操作和屏幕阅读器
- ✅ **零依赖**：纯 HTML/CSS/JavaScript，无需后端
- ✅ **快速部署**：静态文件，可部署到任何服务器

---

## 📁 文件结构

```
demo-school/
├── index.html                    # 首页
├── announcements.html            # 公告列表页
├── announcement-detail.html      # 公告详情页
├── publish.html                  # 发布/编辑公告表单
├── styles.css                    # 全局样式和 CSS 变量
├── assets/
│   └── images/                   # 图片资源目录
└── README.md                      # 本文档
```

### 页面说明

| 页面 | 文件 | 功能 |
|------|------|------|
| 首页 | `index.html` | 展示置顶公告、最新公告聚合、搜索筛选 |
| 列表 | `announcements.html` | 完整公告列表，支持多条件筛选、分页、排序 |
| 详情 | `announcement-detail.html` | 单条公告详情，包含图片轮播、附件、评论 |
| 发布 | `publish.html` | 发布/编辑公告表单，含验证和草稿保存 |

---

## 🚀 快速开始

### 方式 1：本地预览（推荐）

1. **下载文件**：将所有文件保存到本地目录
2. **打开浏览器**：直接打开 `index.html` 文件
3. **开始浏览**：点击导航链接体验各个页面

```bash
# Windows 用户（在文件管理器）
双击 index.html

# macOS/Linux 用户（终端）
open index.html
# 或
firefox index.html
```

### 方式 2：简单 Web 服务器

#### Python
```bash
# Python 3.x
python -m http.server 8000

# Python 2.x
python -m SimpleHTTPServer 8000
```

#### Node.js
```bash
# 使用 http-server
npx http-server

# 或 serve
npx serve
```

#### 其他服务器
- **Live Server**（VS Code 扩展）：右键点击 HTML 文件，选择 "Open with Live Server"
- **PHP**：`php -S localhost:8000`

---

## 🎨 快速定制化（品牌适配）

### 步骤 1：修改顶部变量

在 **每个 HTML 文件** 的 `<style>` 块顶部找到：

```html
<style>
    :root {
        --primary-color: #3b82f6;      /* 修改这里 - 主色 */
        --primary-dark: #1e40af;       /* 修改这里 - 深色 */
        --school-name: '示范中学';      /* 修改这里 - 学校名 */
        --bg-image: url('...');         /* 修改这里 - 背景图 */
    }
</style>
```

**示例：假设要为"第一中学"定制**

```css
:root {
    --primary-color: #ef4444;          /* 改成红色 */
    --primary-dark: #991b1b;           /* 深红色 */
    --school-name: '第一中学';
    --bg-image: url('https://images.unsplash.com/photo-...?w=1200');
}
```

### 步骤 2：修改学校名称

在 HTML 中查找并替换以下位置：
- 导航栏 Logo 处的 "示范中学"
- 页面 title 标签中的 "示范中学"
- 页脚信息中的学校名称

**快速替换命令**（使用文本编辑器的查找替换）：
```
查找：示范中学
替换为：[您的学校名]
全部替换
```

### 步骤 3：修改背景图片

在 CSS 变量中修改背景图 URL：

```css
--bg-image: url('https://your-domain.com/banner.jpg?w=1200&h=400');
```

**推荐图片来源**：
- Unsplash：https://unsplash.com/
- Pexels：https://pexels.com/
- 学校自有图片：上传到服务器后引用

### 步骤 4：调整颜色方案

**常见颜色方案**：

```css
/* 蓝色（默认）*/
--primary-color: #3b82f6;
--primary-dark: #1e40af;

/* 绿色 */
--primary-color: #10b981;
--primary-dark: #047857;

/* 红色 */
--primary-color: #ef4444;
--primary-dark: #991b1b;

/* 紫色 */
--primary-color: #8b5cf6;
--primary-dark: #6d28d9;

/* 青色 */
--primary-color: #06b6d4;
--primary-dark: #0891b2;
```

---

## 📦 部署到服务器

### 方案 1：传统虚拟主机（FTP）

1. **准备文件**：将所有文件打包（除了 README.md）
2. **使用 FTP 工具**：FileZilla、WinSCP 等
3. **上传到服务器**：通常上传到 `/public_html` 或 `/www` 目录
4. **访问**：`https://your-school-domain.edu.cn/announcements/`

### 方案 2：云平台部署

#### GitHub Pages（免费，无流量限制）

```bash
# 1. 创建仓库 your-username.github.io
# 2. 克隆到本地
git clone https://github.com/your-username/your-username.github.io.git
cd your-username.github.io

# 3. 复制文件到仓库
cp -r demo-school/* ./

# 4. 提交并推送
git add .
git commit -m "Add school announcements site"
git push origin main

# 5. 访问 https://your-username.github.io/
```

#### Netlify（推荐，有 CI/CD）

```bash
# 1. 登录 https://netlify.com
# 2. 新建站点，选择文件夹拖拽上传
# 或使用 Netlify CLI

npm install -g netlify-cli
netlify deploy --prod

# 3. 获得自动生成的 URL 或自定义域名
```

#### Vercel

```bash
npm install -g vercel
vercel --prod
```

#### 阿里云 OSS

```bash
# 1. 上传所有文件到 OSS bucket
# 2. 配置静态网站托管
# 3. 绑定自定义域名
```

### 方案 3：Docker 部署（适合内网服务器）

创建 `Dockerfile`：

```dockerfile
FROM nginx:alpine
COPY . /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

构建和运行：

```bash
docker build -t school-announcements .
docker run -d -p 8080:80 school-announcements
```

---

## 🔧 进阶配置

### 修改示例数据

所有示例数据存储在 JavaScript 中：

**首页（index.html）**：
```javascript
const announcementsData = [
    {
        id: 1,
        title: '您的公告标题',
        category: 'notice',      // notice, event, news, academic
        date: '2024-08-20',
        author: '部门名称',
        content: '公告摘要...',
        image: 'https://...',
        badge: 'normal',         // normal, hot, important
        views: 456,
        attachments: []
    },
    // 更多公告...
];
```

**编辑时**：
1. 在各页面的 `<script>` 部分找到 `announcementsData` 或 `announcementsMap`
2. 修改或添加记录
3. 图片 URL 保持不变或替换为自己的 URL

### 集成真实数据源

如需从服务器动态加载数据，修改 JavaScript 代码：

```javascript
// 替换这段代码
const announcementsData = [...];

// 为这段代码
async function loadAnnouncements() {
    const response = await fetch('/api/announcements');
    return await response.json();
}

// 初始化时调用
document.addEventListener('DOMContentLoaded', async () => {
    const data = await loadAnnouncements();
    renderAnnouncements(data);
});
```

### SEO 优化

修改 HTML 中的 meta 标签：

```html
<meta name="description" content="第一中学官方公告站，发布校园新闻和通知">
<meta name="keywords" content="第一中学,公告,校园新闻,通知">
<meta property="og:title" content="第一中学 - 公告站">
<meta property="og:description" content="学校官方公告与校园新闻发布平台">
<meta property="og:image" content="https://your-domain.com/og-image.jpg">
```

### 启用暗色模式

在 `styles.css` 中已包含暗色模式样式，浏览器会自动根据系统设置应用。要强制启用，在 HTML 中添加：

```html
<html lang="zh-CN" style="color-scheme: dark;">
```

---

## 🔐 安全建议

1. **修改示例数据**：确保不包含真实个人信息
2. **使用 HTTPS**：所有生产环境必须使用 HTTPS
3. **内容验证**：如部署在服务器上且支持用户上传，需要添加服务端验证
4. **访问控制**：根据需要限制发布权限
5. **备份**：定期备份公告数据

---

## 📱 性能优化

### 图片优化

使用 WebP 格式和响应式图片：

```html
<picture>
    <source srcset="image.webp" type="image/webp">
    <img src="image.jpg" alt="描述">
</picture>
```

### 懒加载

在列表页添加图片懒加载：

```html
<img loading="lazy" src="image.jpg" alt="描述">
```

### 缓存策略

配置服务器缓存：

```nginx
# nginx 配置示例
location ~* \.(jpg|jpeg|png|gif|ico|css|js)$ {
    expires 30d;
}
```

---

## 📊 浏览器兼容性

| 浏览器 | 最低版本 | 支持度 |
|--------|---------|--------|
| Chrome | 88+ | ✅ 完美支持 |
| Firefox | 85+ | ✅ 完美支持 |
| Safari | 14+ | ✅ 完美支持 |
| Edge | 88+ | ✅ 完美支持 |
| IE 11 | - | ❌ 不支持 |

---

## 🆘 常见问题

### Q: 页面打开全是乱码？
**A**: 确保 HTML 文件的字符编码为 UTF-8。在编辑器中检查：
- VS Code：右下角选择 UTF-8
- Notepad++：编码 > UTF-8 无 BOM

### Q: 样式没有显示，全是空白？
**A**: 检查：
1. 网络连接正常（CDN 可访问）
2. 浏览器控制台是否有错误
3. 清除浏览器缓存并刷新

### Q: 怎样在内网部署？
**A**: 使用本地 HTTP 服务器或 Docker，避免依赖外部 CDN。下载本地 Tailwind 和 FontAwesome。

### Q: 能否支持多语言？
**A**: 当前仅支持中文。要添加多语言，需要修改 HTML 中的所有文本字符串。

### Q: 如何添加评论功能？
**A**: 当前版本在详情页有评论 UI，但数据仅存储在本地。要持久化，需要后端支持（数据库）。

---

## 📞 技术支持

如遇到问题：

1. **检查浏览器控制台**（F12）查看错误信息
2. **查看本 README 的常见问题部分**
3. **验证文件路径和链接**是否正确
4. **确保 CDN 资源可访问**（Tailwind CSS、FontAwesome）

---

## 📄 许可证

本项目仅供学校内部使用，不允许商业用途。

---

## 🎯 下一步

### 建议添加的功能

1. **后端 API 集成**：连接数据库实现数据持久化
2. **用户认证**：添加登录和权限管理
3. **搜索引擎**：实现全文搜索
4. **通知系统**：邮件/短信推送
5. **分析统计**：查看浏览量、用户行为
6. **内容管理系统（CMS）**：Web 界面管理公告
7. **移动 App**：原生或混合开发应用

### 推荐技术栈

- **前端框架**：Vue 3 / React
- **后端**：Node.js (Express/Koa) / Python (Django/FastAPI)
- **数据库**：PostgreSQL / MySQL
- **部署**：Kubernetes / Docker Compose

---

**最后更新**：2024年12月7日  
**版本**：1.0 Beta  
**作者**：School Announcements Team
