# Stage 1: 构建 snk
FROM oven/bun:1 AS snk-builder

WORKDIR /snk

# 克隆 snk 仓库
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/Platane/snk.git .

# 安装依赖
RUN bun install

# Stage 2: 运行环境 - 使用 bun 镜像以支持 TypeScript
FROM oven/bun:1

ENV TZ=Asia/Shanghai

# 安装必要的工具
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    bash \
    cron \
    tzdata \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# 从构建阶段复制 snk
COPY --from=snk-builder /snk /snk

WORKDIR /app

COPY scripts/ /app/scripts/
RUN chmod +x /app/scripts/*.sh

RUN mkdir -p /app/output/grs /app/output/snk

# 每小时执行一次
RUN echo "0 * * * * /app/scripts/run-all.sh >> /var/log/cron.log 2>&1" > /etc/crontab

COPY scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
