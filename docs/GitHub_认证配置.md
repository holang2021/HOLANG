# GitHub 认证配置

## 方式一：OAuth（CodeBuddy 连接器）

| 属性 | 值 |
|------|-----|
| **用途** | 只读操作（查看仓库、Issue、PR） |
| **Token 格式** | `ghu_` 开头 |
| **权限** | `read:user` — 只读 |
| **获取方式** | CodeBuddy 设置 → 连接器 → GitHub MCP |

## 方式二：Personal Access Token（推荐）

| 属性 | 值 |
|------|-----|
| **用途** | 读写操作（创建 Issue、上传文件、关闭 Issue） |
| **Token 格式** | `github_pat_` 或 `ghp_` 开头 |
| **权限** | `Contents: Read & Write` + `Issues: Read & Write` |
| **获取方式** | GitHub → Settings → Developer settings → Personal access tokens |

### Classic Token（最简）

1. 打开: `https://github.com/settings/tokens`
2. 点左侧 **「Tokens (classic)」**
3. 点 **「Generate new token」→ 「Generate new token (classic)」**
4. 填写: Note=`CodeBuddy OPS`, 勾选 `☑️ repo`
5. 生成 → 复制 `ghp_` 开头的绿色字
6. 发给 Agent

### Fine-grained Token

1. 打开: `https://github.com/settings/personal-access-tokens/new`
2. Token name: `CodeBuddy OPS`
3. Expiration: `90 days`
4. Repository access: `Only select repositories` → `holang2021/HOLANG`
5. Permissions → 点 **"+ Add permissions"**:
   - `Contents` → **Read and write**
   - `Issues` → **Read and write**
6. 点 **Generate token** → 复制 `github_pat_` 开头的码

## Token 使用方式

Agent 通过以下命令使用 Token（不在对话中永久存储）：

```bash
# 保存到临时文件
echo -n "TOKEN" > /tmp/gh_pat.txt && chmod 600 /tmp/gh_pat.txt

# 通过环境变量使用
TOKEN=$(cat /tmp/gh_pat.txt)
curl -H "Authorization: Bearer ${TOKEN}" "https://api.github.com/..."

# 用完即删
rm -f /tmp/gh_pat.txt
```

## Token 安全提醒

- ⚠️ Token 在对话中出现后 **建议去 GitHub Revoke 重新生成**
- ⚠️ 不要将 Token 写入代码仓库
- ✅ 用完即焚，临时文件在会话结束后自动清理
