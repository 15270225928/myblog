#!/bin/bash
echo "🚀 开始全自动编译并发布博客..."
hexo clean
hexo g
echo "📂 正在将网页传送到 Nginx 目录..."
cp -r public/* /var/www/html/
chmod -R 777 /var/www/html/
echo "✨ 发布成功！你的新主页已全网同步！"
