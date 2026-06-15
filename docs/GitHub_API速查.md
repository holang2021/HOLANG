# GitHub API 速查

## 基础信息

| 属性 | 值 |
|------|-----|
| **Base URL** | `https://api.github.com` |
| **认证头** | `Authorization: Bearer {TOKEN}` |
| **API 版本** | `X-GitHub-Api-Version: 2022-11-28` |
| **仓库** | `holang2021/HOLANG` |

---

## Issues（事项）

### 创建 Issue

```bash
curl -X POST -H "Authorization: Bearer ${TOKEN}" \
  -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/holang2021/HOLANG/issues" \
  -d '{"title":"标题","body":"描述","labels":["Phase1"]}'
```

### 列出 Issues

```bash
curl -H "Authorization: Bearer ${TOKEN}" \
  "https://api.github.com/repos/holang2021/HOLANG/issues?state=open"
```

### 关闭 Issue

```bash
curl -X PATCH -H "Authorization: Bearer ${TOKEN}" \
  "https://api.github.com/repos/holang2021/HOLANG/issues/{N}" \
  -d '{"state":"closed","state_reason":"completed"}'
```

### 添加标签

```bash
curl -X POST -H "Authorization: Bearer ${TOKEN}" \
  "https://api.github.com/repos/holang2021/HOLANG/issues/{N}/labels" \
  -d '{"labels":["bug:P0","Phase1"]}'
```

---

## Labels（标签）

### 创建 Label

```bash
curl -X POST -H "Authorization: Bearer ${TOKEN}" \
  "https://api.github.com/repos/holang2021/HOLANG/labels" \
  -d '{"name":"bug:P0","color":"FF0000","description":"阻断上线"}'
```

### 列出 Labels

```bash
curl -H "Authorization: Bearer ${TOKEN}" \
  "https://api.github.com/repos/holang2021/HOLANG/labels"
```

---

## Contents（文件）

### 上传文件

```bash
CONTENT_B64=$(echo -n "文件内容" | base64)
curl -X PUT -H "Authorization: Bearer ${TOKEN}" \
  "https://api.github.com/repos/holang2021/HOLANG/contents/path/file.md" \
  -d "{\"message\":\"commit说明\",\"content\":\"${CONTENT_B64}\"}"
```

### 读取文件

```bash
curl -H "Authorization: Bearer ${TOKEN}" \
  "https://api.github.com/repos/holang2021/HOLANG/contents/path/file.md"
```

---

## 常用 Labels 速查

| Label | 颜色 | 含义 |
|------|------|------|
| `bug:P0` | `FF0000` | 阻断上线 |
| `bug:P1` | `FF4444` | 严重 |
| `bug:P2` | `FF8800` | 一般 |
| `bug:P3` | `FFCC00` | 轻微 |
| `Phase1`-`Phase6` | `7057FF` | 建设阶段 |
| `test:case` | `0E8A16` | 测试用例 |
| `test:regression` | `0E8A16` | 回归测试 |
| `doc:report` | `1D76DB` | 验收/复盘报告 |
| `ops:blocked` | `B60205` | 阻塞项 |
| `ops:risk` | `FBCA04` | 风险关注 |

---

## 项目资料库（tdrive）

| 属性 | 值 |
|------|-----|
| **项目 Root ID** | `CemooTlwmyhE` |
| **OPS知识库 ID** | `ChqtrbtwzFMG` |
| **可用工具** | `dir_create`, `dir_list`, `download`, `upload_apply`, `upload_complete` |
