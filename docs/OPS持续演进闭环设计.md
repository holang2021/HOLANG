# 🔄 OPS 持续演进闭环 — 架构设计

> **版本：** v1.0  
> **设计日期：** 2026-06-15  
> **核心理念：** 先用后改，持续打磨，化外部为自有

---

## 一、闭环全景图

```
┌─────────────────────────────────────────────────────────┐
│                     🏢 企业微信                           │
│  员工提出问题 → Webhook → GitHub Issue 自动创建           │
└─────────────────────┬───────────────────────────────────┘
                      ↓
          ┌───────────────────────┐
          │   🎯 ops-gate 需求评估  │
          │   产出: GOAL_REQ_xxx   │
          └───────────┬───────────┘
                      ↓
          ┌───────────────────────┐
          │   🔍 技能发现引擎       │
          │  ① 查自有 ops-* (8个)  │
          │  ② 查本地已安装技能     │
          │  ③ 搜 GitHub marketplace│
          │  ④ 搜 WorkBuddy skills.sh│
          └───────────┬───────────┘
                      ↓
          ┌───── 有现成？─────┐
          ↓ YES               ↓ NO
  ┌───────────────┐   ┌───────────────┐
  │ 先用 (install) │   │ 🆕 搭建新技能   │
  │ npx skills add│   │ ops- 命名规范  │
  └───────┬───────┘   └───────┬───────┘
          ↓                   ↓
  ┌───────────────────────────────┐
  │   📋 复刻改造                   │
  │   fork → 改 SKILL.md           │
  │   → 加入 plugin.json           │
  │   → push holang2021/HOLANG    │
  └───────────────┬───────────────┘
                  ↓
  ┌───────────────────────────────┐
  │   🧪 使用验证 + 数据采集        │
  │   记录使用次数/成功率/问题      │
  └───────────────┬───────────────┘
                  ↓
  ┌───────────────────────────────┐
  │   🔧 持续打磨迭代               │
  │   GOAL_WEEKLY → 优化建议       │
  │   PR → review → merge          │
  └───────────────┬───────────────┘
                  ↓
  ┌───────────────────────────────┐
  │   📢 平台推送更新               │
  │   npx skills update            │
  │   团队自动获取最新版本          │
  └───────────────────────────────┘
```

---

## 二、企业微信 → GitHub 桥接

### 方案

企业微信 **不支持直接 Webhook 到 GitHub**，需要中间层。

```
企业微信群机器人 → Webhook → Cloud Function/中间服务 → GitHub Issues API
```

### 推荐实现路径

| 方案 | 复杂度 | 说明 |
|------|:---:|------|
| **A. GitHub Issue 手动创建（当前）** | ⭐ | 员工在 企业微信 @机器人 → 人工/Agent 在 GitHub 建 Issue |
| **B. Cloudflare Workers Webhook** | ⭐⭐ | 免费、全球部署、一行代码转发 |
| **C. Make/Zapier 自动化** | ⭐ | 可视化配置，无代码 |

### 方案 B 示例（Cloudflare Workers）

```javascript
// 企业微信消息 → GitHub Issue
addEventListener('fetch', event => event.respondWith(handleRequest(event.request)))
async function handleRequest(request) {
  const body = await request.json()
  const title = `[企业微信] ${body.msg}`
  const res = await fetch('https://api.github.com/repos/holang2021/HOLANG/issues', {
    method: 'POST',
    headers: { 'Authorization': `token ${GITHUB_PAT}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({ title, labels: ['enhancement'], body: `来源: 企业微信\n内容: ${body.msg}` })
  })
  return new Response(JSON.stringify(await res.json()), { headers: { 'content-type': 'application/json' } })
}
```

**当前阶段用方案 A**，员工在群里提出问题 → 你在 GitHub 创建 Issue → Agent 接管后续。

---

## 三、技能发现引擎

### 搜索优先级

```
优先级 1: 自有 ops-* 技能（8个，本地已验证）
优先级 2: 本地已安装技能（/root/.codebuddy/skills/）
优先级 3: GitHub Skills 市场搜索
优先级 4: WorkBuddy CodeBuddy 技能注册表（skills.sh / agent-skills.cc）
```

### 搜索策略

| 来源 | 搜索方式 | 示例 |
|------|------|------|
| 自有技能 | 直接匹配 `ops-<功能>` | ops-regression |
| 本地技能 | `ls /root/.codebuddy/skills/` | browser-testing-with-devtools |
| GitHub 市场 | `gh search repos "SKILL.md" --topic skills` | 搜索公开技能仓库 |
| WorkBuddy 注册表 | `npx skills search <关键词>` | `npx skills search "wechat"` |

### 评估标准

| 维度 | 权重 | 评分标准 |
|------|:---:|------|
| 功能匹配 | 40% | 覆盖需求的百分之几 |
| 开箱即用 | 20% | 能否直接安装使用 |
| 可定制性 | 20% | SKILL.md 是否清晰可改 |
| 活跃度 | 10% | 最近更新/Star 数 |
| 许可证 | 10% | MIT/Apache 优先 |

---

## 四、复刻改造流程

### Step 1: 安装试用

```bash
npx skills add <repo-url>    # 安装到本地
# 试用 2-3 次真实场景
# 记录：哪里好用、哪里卡壳
```

### Step 2: 复刻

```bash
# Fork 原仓库到 holang2021
gh repo fork <原始仓库> --clone

# 修改 SKILL.md
- 更新 name → ops-<新名字>
- 更新 description → 中文描述
- 添加 OPS 集成点
- 标注触发词
```

### Step 3: 改造

修改 SKILL.md：
1. 加 OPS 六阶段关联
2. 加 Issue 自动创建逻辑
3. 加 GOAL 推进闭环埋点
4. 加知识库归档规则

### Step 4: 加入体系

```bash
# 加入 plugin.json skills 列表
# 加入知识库索引
# push → CI 自动验证
git add . && git commit -m "ops: add forked skill ops-<name>" && git push
```

### Step 5: 持续迭代

根据 GOAL_WEEKLY 周报的反馈：
- 使用频率低的 → 合并/下沉/废弃
- 报错/卡壳的 → 修复
- 缺失功能的 → 补充

---

## 五、每周推送机制

### 当前可用方案

| 方案 | 触发 | 持久化 | 说明 |
|------|:---:|:---:|------|
| **CronCreate 定时** | 每周一 09:00 | ❌ 会话级 | 仅本 session 有效 |
| **GitHub Issue 周报** | 手动/定时 | ✅ 永久 | 写入 repo |
| **知识库 GOAL_WEEKLY** | 手动/定时 | ✅ 永久 | 文档归档 |

### 实际运行方案

```
每周一：
  1. CronCreate 触发 → Agent 自动生成 GOAL_WEEKLY
  2. 内容推送为 GitHub Issue
  3. 同时写入 docs/GOAL_WEEKLY_{年}W{周}.md
  4. 更新知识库索引
  
内容包含：
  - 📊 本周进展（Issue 关闭/新建/阻塞统计）
  - 🔧 技能使用统计（次数/成功率）
  - 🆕 新技能引入/复刻情况
  - ⚠️ 阻塞项
  - 📈 趋势分析
  - 🎯 下周计划
```

---

## 六、闭环验证清单

| 步骤 | 能否跑通 | 状态 |
|------|:---:|:---:|
| 员工 企业微信 提出问题 | ✅ (手动→Issue) | 当前 |
| Agent 识别需求 → GOAL_REQ | ✅ | ops-gate |
| 搜索自有技能匹配 | ✅ | 8个 ops-* |
| 搜索外部技能 | ✅ | GitHub/WorkBuddy |
| 安装试用 | ✅ | npx skills add |
| Fork + 改造 | ✅ | git + 本地编辑 |
| 推入 HOLANG 仓库 | ✅ | gh push |
| CI 自动验证 | ✅ | ops-quality-gate.yml |
| 团队 npx skills update 获取 | ✅ | plugin.json |
| 使用数据收集 | ⚠️ | 需手动记录 |
| 每周自动周报 | ✅ | CronCreate + GitHub Issue |
| 打磨迭代 | ✅ | PR → review → merge |

---

## 七、需要你做的事（一次性）

| 事项 | 说明 | 优先级 |
|------|------|:---:|
| GitHub PAT 配好 workflow scope | ✅ 已完成 | P0 |
| 企业微信 Webhook 配置 | 可选，当前手动建 Issue | P2 |
| 团队安装 `npx skills add holang2021/HOLANG` | 让他们执行一次 | P1 |
| 每周一来看周报 | GitHub Issue 自动创建 | P1 |

---

> 📌 **核心信念：** 不追求一步完美，每周推进一步。系统自己能跑的交给系统，需要人判断的留给人。
