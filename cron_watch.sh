#!/bin/bash
cd /root/myblog
echo "🕒 升级版智能轮询同步已启动，正在死死盯着文章和全局配置..."

LAST_STATE=""

while true; do
    # 🌟 核心升级：同时计算【文章目录】和【_config.yml配置文件】的最新修改状态
    CURRENT_STATE=$(md5sum source/_posts/*.md _config.yml 2>/dev/null)
    
    if [ "$CURRENT_STATE" != "$LAST_STATE" ] && [ -n "$LAST_STATE" ]; then
        echo "🎵 抓到更新了（可能是文章，也可能是全局配置）！正在为您全自动发布..."
        ./deploy.sh
    fi
    
    LAST_STATE="$CURRENT_STATE"
    sleep 15
done
