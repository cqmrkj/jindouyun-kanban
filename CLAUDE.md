<!-- 此文件由团队工具维护，请勿使用 /init 覆盖。如需更新项目信息请直接编辑。 -->
# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

筋斗云工作看板 — 纯静态单页看板，展示 AI 助理的实时工作状态（进行中/已完成/计划中任务）。数据源为 `status.json`，由外部脚本或 CI 更新。部署在 GitHub Pages。

## 技术栈

- 纯 HTML + CSS + 原生 JS（单文件 `index.html`，无框架、无构建工具、无包管理器）
- 数据驱动：`status.json` → 前端 fetch 渲染
- CI：GitHub Actions（AI Code Review + @wukong 互动回复）

## 构建命令

无构建步骤。直接编辑 `index.html` 和 `status.json`。
更新看板数据后运行 `./update.sh` 自动 commit + push。

## 架构约定

- **单文件架构**：所有 HTML/CSS/JS 在 `index.html` 内，无外部依赖
- **数据格式**：`status.json` 包含 `lastUpdate`、`inProgress`、`completed`、`planned`、`insights` 字段
- **自动刷新**：页面每 30 秒自动 fetch `status.json`
- **分支模型**：只有 `main` 分支，直接推送（非标准前端项目，不走 prod/test 流程）

## 注意事项

- `update.sh` 会执行 `git add -A` + `git push`，运行前确认无敏感文件
- `status.json` 是外部脚本生成的数据文件，手动编辑时需保持 JSON 格式合法
- PR 会触发 GPT-5.3 Codex AI 评审（`.github/workflows/ai-review.yml`）
- 人类评论会触发 @wukong 自动回复（`.github/workflows/wukong-reply.yml`）
- 项目无 package.json，不适用 pnpm/npm/bun

<!-- TEAM-STANDARDS-BEGIN v1 -->
## 团队开发规范

### Git 规范
- **Commit 信息必须中文**，格式 `类型: 描述`（功能/修复/重构/文档/工具）
  - 示例：`功能: 添加用户登录`、`修复: 解决首页白屏问题`、`重构: 简化验证逻辑`
- **禁止在 dev/test/master/prod 分支直接修改代码**，必须从生产分支切 feat/ 或 fix/ 分支
- 后端生产分支: `master`；前端生产分支: `prod`
- test 和 release 分支可直接推送，流水线自动部署

### AI 代码评审
- PR 会自动触发 AI 评审（GPT-5.3 Codex + Codex Cloud 双重评审）
- 评审结果以行内评论形式出现，P0/P1 级问题必须修复后再合并
- 任何人类评论会自动触发 AI 重新分析并回复（无需 @wukong）
- Codex Cloud 同时启用，与 GPT-5.3 评审并存互补

### 部署流程
- 测试环境: 合并到 dev/test 分支 → 流水线自动部署
- 灰度环境: 合并到 release 分支 → 流水线自动部署
- 生产环境: 提 PR 合并到 master/prod → 流水线自动部署
- 所有环境使用 Kubernetes + Kuboard 部署

### Claude Code 配置
- `.claude/settings.json` 是团队共享配置，**不要修改**
- 个人偏好放 `.claude/settings.local.json`（已 gitignore）
- **不要使用 `/init` 命令**，会覆盖团队维护的 CLAUDE.md

### 包管理器
- Node: 必须用 `pnpm`（gather-mall 例外用 npm）
- fe-manage-hub: 用 `bun`
<!-- TEAM-STANDARDS-END -->
