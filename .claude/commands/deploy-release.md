将当前特性分支合并到 release 分支并推送，触发灰度环境自动部署。

## 安全检查

- 确认当前不在 release/master/prod 分支上
- 确认代码已在测试环境验证通过

## 执行步骤

1. 记住当前分支名
2. `git fetch origin release`
3. `git checkout release`
4. `git merge --no-ff {当前分支名}`
5. 如果有冲突，帮用户解决后再继续
6. `git push origin release`
7. `git checkout {当前分支名}` 切回原分支

## 完成后提醒

- 检查云效流水线是否成功触发
- 灰度环境部署通常需要 3-5 分钟
- 灰度验证通过后，再提 PR 合并到生产分支
