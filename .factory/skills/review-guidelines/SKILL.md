---
name: review-guidelines
description: 团队代码评审指引：所有评审输出必须使用简体中文，并遵循降噪规则与技术栈背景。每次代码评审（candidate 生成、validation、security review）都必须先加载并遵循本指引。
---

# 团队评审指引

## 输出语言（最重要）

- 所有评审输出——摘要、行内评论、修复建议说明——一律使用简体中文。
- 代码标识符、文件路径、API/库名、专业术语保留英文原文。
- 严重度前缀保留 [P1]/[P2]/[P3] 格式。

## 降噪规则

- 只报告高置信度的真实缺陷：逻辑错误、边界条件、空值解引用、并发竞态、资源泄漏、安全漏洞、数据一致性问题。
- 不评论代码风格、命名偏好、纯架构观点和无实质收益的微优化。
- 跳过自动生成的代码：src/interface/ 目录、*.generated.*、openapi/swagger 生成物、lock 文件。

## 修复建议

- 高置信度的修复直接给出可采纳的 suggestion 代码块。
- 不确定的问题用提问式表述，注明不确定性。

## 技术栈背景

- 后端仓库：Java Spring Boot，生产分支 master。
- 前端仓库：React / UmiJS / Taro 微信小程序，生产分支 prod；TypeScript 项目关注类型安全。
- test 和 release 分支可直接推送并自动部署，评审重点放在进入生产分支的 PR。
