# Resource Updater

自动更新 GitHub Readme Stats SVG 图片，文件保存在本地供 README 引用

- 定时执行（每天 8:00 和 20:00）
- 自动获取 GitHub Readme Stats SVG 图片
- 文件保存在 `../ResourceOutput/` 目录

```bash
# 手动触发更新
docker compose exec resource-updater /app/scripts/run-all.sh
```

## 关于 Contribution Snake

Contribution Snake（贡献蛇形图）由于依赖 GitHub Actions 环境，建议保留原有的 GitHub Actions workflow 来生成。

如果需要在本地生成，可以使用 [act](https://github.com/nektos/act) 工具运行 GitHub Actions。
