#!/bin/bash
MONITOR_DIR="/root/myblog/source/_posts/"

echo "👀 自动化盯工守护进程已启动，正在死死盯着后台文章变动..."

# 使用 inotify 监听文件夹的修改、创建和删除事件
inotifywait -mrq -e modify,delete,create,attrib "$MONITOR_DIR" | while read -r directory events filename; do
    # 排除临时文件和隐藏文件
    if [[ ! "$filename" =~ ^\. ]] && [[ "$filename" =~ \.md$ ]]; then
        echo "🎵 抓到你在网页后台修改了文章: $filename，正在为你自动发布..."
        cd /root/myblog
        ./deploy.sh
        echo "✅ 自动发布完成！继续为您盯着..."
    fi
done
