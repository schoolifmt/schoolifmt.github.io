#!/bin/bash

# =====================================================================
# 学校公告站点 - 快速定制化脚本
# =====================================================================
#
# 用途：为不同学校快速生成定制化的公告站点
#
# 使用方法：
#   chmod +x customize.sh
#   ./customize.sh "学校名称" "#3b82f6" "学校描述"
#
# 示例：
#   ./customize.sh "第一中学" "#ef4444" "第一中学官方公告站"
#   ./customize.sh "清华大学" "#8b5cf6" "清华大学校园信息发布平台"
#
# 输出：
#   ./output/[学校名]/ （包含定制化的所有文件）
#
# =====================================================================

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查参数
if [ "$#" -lt 2 ]; then
    echo -e "${RED}❌ 参数不足${NC}"
    echo "用法: ./customize.sh '学校名称' '主色代码' [学校描述]"
    echo ""
    echo "示例:"
    echo "  ./customize.sh '第一中学' '#ef4444' '第一中学官方公告站'"
    echo "  ./customize.sh '清华大学' '#8b5cf6'"
    exit 1
fi

SCHOOL_NAME=$1
PRIMARY_COLOR=$2
DESCRIPTION=${3:-"$SCHOOL_NAME官方公告站"}
SCHOOL_DIR="output/${SCHOOL_NAME}"

echo -e "${YELLOW}🚀 开始定制化学校公告站${NC}"
echo "学校名称: $SCHOOL_NAME"
echo "主色代码: $PRIMARY_COLOR"
echo "学校描述: $DESCRIPTION"
echo ""

# 创建输出目录
mkdir -p "$SCHOOL_DIR/assets/images"
echo -e "${GREEN}✅ 创建目录${NC}"

# 复制基础文件
cp *.html "$SCHOOL_DIR/"
cp styles.css "$SCHOOL_DIR/"
cp README.md "$SCHOOL_DIR/"
echo -e "${GREEN}✅ 复制文件${NC}"

# 定制化 HTML 文件
for html_file in "$SCHOOL_DIR"/*.html; do
    # 替换学校名称
    sed -i "s/示范中学/$SCHOOL_NAME/g" "$html_file"
    
    # 替换主色代码
    sed -i "s/#3b82f6/$PRIMARY_COLOR/g" "$html_file"
    
    # 替换学校描述
    sed -i "s/学校官方公告/$DESCRIPTION/g" "$html_file"
done

# 定制化 CSS 文件
sed -i "s/示范中学/$SCHOOL_NAME/g" "$SCHOOL_DIR/styles.css"

echo -e "${GREEN}✅ 完成文本替换${NC}"

# 创建学校特定的配置文件
cat > "$SCHOOL_DIR/config.json" << EOF
{
  "schoolName": "$SCHOOL_NAME",
  "primaryColor": "$PRIMARY_COLOR",
  "description": "$DESCRIPTION",
  "createdAt": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "version": "1.0"
}
EOF

echo -e "${GREEN}✅ 创建配置文件${NC}"

# 创建快速部署脚本
cat > "$SCHOOL_DIR/deploy.sh" << 'DEPLOY_EOF'
#!/bin/bash

# 简单的部署脚本
DEPLOY_DIR="/var/www/school-announcements"
BACKUP_DIR="/var/backups/school-announcements"

echo "开始部署..."

# 备份现有文件
if [ -d "$DEPLOY_DIR" ]; then
    sudo mkdir -p "$BACKUP_DIR"
    sudo cp -r "$DEPLOY_DIR" "$BACKUP_DIR/backup-$(date +%Y%m%d-%H%M%S)"
    echo "✅ 已备份现有文件"
fi

# 复制新文件
sudo mkdir -p "$DEPLOY_DIR"
sudo cp -r ./* "$DEPLOY_DIR/"
sudo chown -R www-data:www-data "$DEPLOY_DIR"
sudo chmod -R 755 "$DEPLOY_DIR"

echo "✅ 部署完成！"
echo "访问地址: https://your-domain.edu.cn"

DEPLOY_EOF

chmod +x "$SCHOOL_DIR/deploy.sh"
echo -e "${GREEN}✅ 创建部署脚本${NC}"

echo ""
echo -e "${GREEN}════════════════════════════════════════${NC}"
echo -e "${GREEN}✅ 定制化完成！${NC}"
echo -e "${GREEN}════════════════════════════════════════${NC}"
echo ""
echo "📁 输出位置: $SCHOOL_DIR"
echo ""
echo "下一步："
echo "1. 进入目录: cd $SCHOOL_DIR"
echo "2. 查看文件: ls -la"
echo "3. 本地预览: open index.html"
echo "4. 部署到服务器: bash deploy.sh"
echo ""
echo "修改建议："
echo "- 在各 HTML 文件中替换 Unsplash 占位图为学校自有图片"
echo "- 修改 config.json 中的其他信息（电话、邮箱等）"
echo "- 根据需要调整公告示例数据"
echo ""
