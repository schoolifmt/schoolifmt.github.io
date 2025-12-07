# 学校公告站点 - 快速开始指南

## 🎯 5 分钟上手

### 第一步：本地预览（Windows/Mac/Linux）

```
1. 找到本项目文件夹
2. 双击打开 index.html
3. 完成！开始浏览
```

### 第二步：定制学校信息

#### 方法 A：自动定制（推荐）

**Windows 用户：**
```
1. 双击 customize.bat
2. 修改脚本内的学校名称和色彩代码
3. 再次运行
4. 自动生成定制版本在 output 文件夹
```

**Mac/Linux 用户：**
```bash
chmod +x customize.sh
./customize.sh "学校名称" "#主色代码" "学校描述"

# 示例
./customize.sh "第一中学" "#ef4444" "第一中学官方公告"
```

#### 方法 B：手动定制

在每个 HTML 文件的顶部找到：

```html
<style>
    :root {
        --primary-color: #3b82f6;      /* ← 修改主色 */
        --school-name: '示范中学';      /* ← 修改学校名 */
    }
</style>
```

**修改这两行后，在文件中查找替换所有出现的 "示范中学"**

### 第三步：上传到服务器

#### 简单方式（FTP）
```
1. 使用 FileZilla 或 WinSCP
2. 连接 FTP 服务器
3. 上传所有 HTML 文件和 CSS 到服务器
4. 完成！
```

#### 推荐方式（GitHub Pages - 免费）
```bash
# 1. 登录 GitHub，创建新仓库
# 仓库名: username.github.io

# 2. 上传文件
git clone https://github.com/username/username.github.io.git
cd username.github.io
# 复制所有文件到此目录

git add .
git commit -m "Add school announcements"
git push

# 3. 访问：https://username.github.io/
```

---

## 📝 文件说明

```
demo-school/
├── 📄 index.html              ← 首页（首先打开这个）
├── 📄 announcements.html      ← 公告列表（可筛选、搜索）
├── 📄 announcement-detail.html ← 公告详情（含轮播、附件）
├── 📄 publish.html            ← 发布公告表单（示例）
├── 🎨 styles.css              ← 全局样式和 CSS 变量
├── 📖 README.md               ← 完整部署指南
├── 🛠 customize.bat           ← Windows 快速定制工具
├── 🛠 customize.sh            ← Mac/Linux 快速定制工具
├── 📋 nginx.conf.example      ← Nginx 服务器配置示例
└── 📁 assets/                 ← 资源文件夹
    └── images/                ← 图片存放位置
```

---

## 🎨 颜色方案快选

替换 CSS 中的 `--primary-color` 和 `--primary-dark`：

| 颜色 | 主色 | 深色 | 应用 |
|------|------|------|------|
| 🔵 蓝色 | #3b82f6 | #1e40af | 默认、教育机构 |
| 🟢 绿色 | #10b981 | #047857 | 环保、健康 |
| 🔴 红色 | #ef4444 | #991b1b | 紧急、重要 |
| 🟣 紫色 | #8b5cf6 | #6d28d9 | 创意、高端 |
| 🔵 青色 | #06b6d4 | #0891b2 | 科技、现代 |
| 🟠 橙色 | #f97316 | #c2410c | 热情、活力 |

---

## 📋 功能清单

- ✅ 首页横幅、置顶公告、聚合最新公告
- ✅ 公告列表支持分类、日期、重要性筛选
- ✅ 高级搜索和排序
- ✅ 详情页含图片轮播、附件下载、评论
- ✅ 发布表单（前端验证、草稿保存）
- ✅ 毛玻璃设计风格（Glassmorphism）
- ✅ 完全响应式（手机/平板/桌面）
- ✅ 无障碍支持（WCAG 标准）
- ✅ 快速定制化工具
- ✅ 零依赖（仅需 HTML/CSS/JS）

---

## 🔧 常见需求

### 改首页公告

编辑 `index.html`，找到：

```javascript
const announcementsData = [
    {
        id: 1,
        title: '你的公告标题',
        category: 'notice',    // 分类
        date: '2024-08-20',    // 日期
        author: '部门',        // 作者
        content: '摘要...',
        image: 'https://...',  // 图片链接
        badge: 'normal',       // 优先级
        views: 456
    }
]
```

### 改颜色主题

最简单的方法：全选 `#3b82f6` 然后替换为目标色

例如改红色：
```
查找：#3b82f6
替换为：#ef4444
全部替换
```

### 改学校名称

```
查找：示范中学
替换为：你的学校名
全部替换
```

### 改背景图片

在 CSS 中找到：
```css
--bg-image: url('https://images.unsplash.com/...');
```

替换为你的图片 URL。推荐：
- Unsplash：https://unsplash.com (搜索 school/education)
- Pexels：https://pexels.com
- 自己的服务器上传

### 添加联系信息

在 `index.html` 页脚找到，修改：
```html
<p>
    <strong>联系方式：</strong><br>
    电话：010-1234-5678<br>
    邮箱：announce@demo-school.edu.cn
</p>
```

---

## 🌐 部署方案对比

| 方案 | 难度 | 成本 | 优点 |
|------|------|------|------|
| GitHub Pages | ⭐ | 免费 | 无限流量，自动备份 |
| Netlify | ⭐ | 免费 | 自动 HTTPS，CI/CD |
| 学校主机 | ⭐⭐ | 有 | 完全控制 |
| VPS | ⭐⭐⭐ | $5-20/月 | 功能完整，性能好 |

---

## 🚀 进阶功能添加

### 连接真实数据库

修改 JavaScript 代码从 API 加载数据：

```javascript
// 原来的静态数据
const announcementsData = [...]

// 改成动态加载
async function loadAnnouncements() {
    const response = await fetch('/api/announcements');
    return await response.json();
}
```

### 添加用户认证

可选后端框架：
- Node.js + Express
- Python + Flask/Django
- PHP + Laravel
- Java + Spring Boot

### 推送通知

集成第三方服务：
- SendGrid（邮件）
- Twilio（短信）
- Firebase（推送）

---

## ⚡ 性能提示

1. **压缩图片**：使用 TinyPNG 或 ImageOptim
2. **启用缓存**：配置服务器缓存静态文件
3. **使用 CDN**：CloudFlare（免费）加速 Tailwind 和 FontAwesome
4. **压缩代码**：生产环境压缩 HTML/CSS/JS

---

## 🔒 安全检查清单

- [ ] 移除所有示例数据
- [ ] 更新学校联系方式
- [ ] 启用 HTTPS（Let's Encrypt 免费）
- [ ] 设置正确的文件权限
- [ ] 定期备份内容
- [ ] 对用户输入进行验证（如有表单）

---

## 📱 浏览器支持

| 设备 | 支持情况 |
|------|---------|
| Chrome 88+ | ✅ 完美 |
| Firefox 85+ | ✅ 完美 |
| Safari 14+ | ✅ 完美 |
| Edge 88+ | ✅ 完美 |
| 移动浏览器 | ✅ 完美 |
| IE 11 | ❌ 不支持 |

---

## 🆘 快速故障排除

| 问题 | 解决方案 |
|------|---------|
| 样式错乱 | 清除浏览器缓存，检查网络连接 |
| 图片不显示 | 验证图片 URL，检查跨域设置 |
| 字体乱码 | 确保文件编码为 UTF-8 |
| 按钮不工作 | 检查浏览器控制台是否有 JS 错误 |
| 移动端布局差 | 检查 `<meta name="viewport">` |

---

## 📞 获取帮助

1. **查看 README.md** - 完整部署指南
2. **检查浏览器控制台** - F12 → Console 查看错误
3. **验证文件路径** - 确保所有链接都正确
4. **测试 CDN** - 访问 https://cdn.tailwindcss.com 确认可用

---

## 📚 学习资源

- **Tailwind CSS 文档**：https://tailwindcss.com/docs
- **FontAwesome 图标**：https://fontawesome.com/icons
- **HTML 语义化**：https://developer.mozilla.org/en-US/docs/Glossary/Semantics
- **Web 可访问性**：https://www.w3.org/WAI/WCAG21/quickref/

---

## 🎓 项目特色

1. **即插即用** - 无需开发知识即可使用
2. **完全定制** - 易于修改颜色、文本、图片
3. **响应式** - 在所有设备上完美显示
4. **现代设计** - 毛玻璃效果、流畅动画
5. **SEO 友好** - 正确的语义 HTML
6. **无障碍** - 符合 WCAG 标准
7. **零成本** - 完全免费使用

---

**祝您使用愉快！如有问题，欢迎反馈。** 🎉

最后更新：2024年12月7日
