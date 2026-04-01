将当前特性分支合并到 test 分支并推送，触发测试环境自动部署。

## 执行步骤

1. 确认当前不在 test/prod 分支上，如果在则拒绝执行并提醒用户切到特性分支
2. 记住当前分支名
3. `git fetch origin test`
4. `git checkout test`
5. `git merge --no-ff {当前分支名}` （保留合并记录）
6. 如果有冲突，帮用户解决后再继续
7. `git push origin test`
8. `git checkout {当前分支名}` 切回原分支

## 完成后提醒

- 检查云效流水线是否成功触发
- 测试环境部署通常需要 3-5 分钟
