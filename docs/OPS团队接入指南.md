# OPS 团队接入指南

## 知识库位置

| 存储 | 路径 | 用途 |
|------|------|------|
| 🌐 **GitHub** | [holang2021/HOLANG](https://github.com/holang2021/HOLANG) | 唯一真相源，所有变更从这里同步 |
| 📁 **项目资料库** | `OPS知识库/` (tdrive) | 团队内部查阅，文档归档 |
| 💻 **本地工作区** | `/workspace/ops-deliverables/` | 草稿与临时产出 |

## 团队接入步骤

### 每个人执行一次

```bash
npx skills add holang2021/HOLANG
```

### 验证

在 CodeBuddy 对话里输入：
```
list skills
```

看到以下 8 个技能即为成功：

```
ops-gate              🛡️ OPS 六阶段主技能
ops-goal-tracker      🎯 Goal 推进引擎
ops-test-generator    🧪 测试用例生成器
ops-bug-standardizer  🐛 Bug 标准化器
ops-regression        🔄 回归验证器
ops-acceptance        📋 版本验收器
ops-retrospect        📊 质量复盘器
ops-knowledge-base    🧠 知识库管理器
```

### 后续更新

当有人更新了仓库里的技能，其他人执行：
```bash
npx skills update holang2021/HOLANG
```

## 企业管理员配置

1. 打开 CodeBuddy 企业控制后台
2. 进入「插件市场」或「Skills 管理」
3. 添加技能源：
   ```
   https://github.com/holang2021/HOLANG
   ```
4. 团队成员在企业后台即可看到并可一键安装

## 同步架构

```
holang2021/HOLANG (GitHub) ← 唯一真相源
       │
       ├── npx skills add ──→ 团队成员本地
       │
       └── 企业后台添加源 ──→ 企业管理后台可见
```

## 角色与权限

| 角色 | 可以做什么 |
|------|------|
| **仓库 Owner** (holang2021) | 修改技能文件、合并 PR、发布新版本 |
| **团队成员** | 安装技能、提交 PR 建议修改 |
| **企业管理员** | 在企业后台配置技能源、查看使用统计 |

---

> 📌 编写日期: 2026-06-15 | 版本: v1.0
