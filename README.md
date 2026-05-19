# 需求分析与智能体调度技能包 (Requirement Agent Dispatch Pack)

一键部署包，包含 `requirement-agent-dispatch` 技能及其调度的 **215 个专业智能体**。

---

## 概述

需求分析与智能体调度技能是 OpenCode 的**中枢调度器**：

1. **拆解需求** — 将用户描述的需求分解为可执行的任务单元
2. **匹配智能体** — 为每个子任务匹配合适的专业 Agent
3. **调度执行** — 支持并行、串行、混合、编排者四种调度模式
4. **验证与润色** — 收集结果、验证质量，最终通过互联网风格检索润色产出

---

## 智能体分类速查

本包内置 **215 个 Agent**，覆盖以下领域：

| 分类 | 数量 | 覆盖场景 |
|------|------|---------|
| 产品与项目管理 | 6+ | 需求分析、Sprint 规划、项目协调、任务拆解 |
| 设计与体验 | 8+ | UI 设计、UX 研究、品牌策略、无障碍审核、趣味注入 |
| 前端开发 | 4+ | Web 前端、小程序、移动端、快速原型 |
| 后端与架构 | 8+ | 系统架构、数据库、数据工程、嵌入式、IoT、FPGA |
| AI 与数据 | 5+ | ML 模型、数据修复、提示词工程、语音 AI |
| 内容与营销 | 20+ | 内容创作、SEO、小红书、抖音、知乎、B站、公众号 |
| 海外社媒 | 10+ | LinkedIn、Instagram、TikTok、Twitter、YouTube |
| 测试与质量 | 8+ | API 测试、性能基准、安全审计、代码审查、模型 QA |
| 运维与基础设施 | 6+ | DevOps、SRE、威胁检测、故障响应 |
| 业务与运营 | 15+ | 私域流量、跨境电商、合同审查、法务合规、招聘 |
| 游戏与 XR | 20+ | Unity、Unreal、Godot、Roblox、XR 开发 |
| 财务与投资 | 8+ | 财务分析、投资研究、税务、发票、风控 |
| 专业服务 | 15+ | 医疗、法律、HR、供应链、采购、物流 |
| 付费广告 | 8+ | Google Ads、社交广告、程序化广告、搜索词分析 |
| 销售与商业 | 10+ | 销售策略、售前、Outbound、投标、Discovery |

完整列表见 `agents/` 目录下的全部 215 个 `.md` 文件。

---

## 一键部署

```bash
# 克隆或解压后，直接运行：
./deploy.sh
```

脚本会自动：
1. 将 `SKILL.md` 部署到 OpenCode skills 目录
2. 将 215 个 Agent 全部部署到 agents 目录（已有则跳过）
3. 验证部署完整性

### 手动部署

```bash
# macOS / Linux
mkdir -p ~/.config/opencode/skills/requirement-agent-dispatch
cp SKILL.md ~/.config/opencode/skills/requirement-agent-dispatch/
cp agents/*.md ~/.opencode/agents/
```

### Windows (PowerShell)

```powershell
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.config\opencode\skills\requirement-agent-dispatch"
Copy-Item "SKILL.md" "$env:USERPROFILE\.config\opencode\skills\requirement-agent-dispatch\"
Copy-Item "agents\*" "$env:USERPROFILE\.opencode\agents\"
```

---

## 使用方式

部署后重启/重载 OpenCode，直接描述你的需求即可：

> "帮我开发一个电商小程序，包括需求分析、UI 设计、前后端开发和测试"

系统会自动：
1. 拆解需求 → 匹配对应 Agent
2. 按依赖关系调度执行（串行/并行混合）
3. 收集所有产出
4. 搜索互联网同类型风格进行润色

### 调度模式速查

| 任务复杂度 | 推荐模式 | 说明 |
|-----------|---------|------|
| 1 个任务 | 单智能体调度 | 派一个 Task，提示递归拆解 |
| 2-4 个独立任务 | 并行调度 | 同时派发 |
| 有顺序依赖 | 流水线调度 | 前一个输出传给后一个 |
| 混合依赖 | 混合调度 | 部分并行 + 部分串行 |
| 5+ 个子任务 | 编排者调度 | 用智能体编排者统一管理 |

---

## 智能体匹配原则

- **颗粒度贪婪匹配** — 每个子领域匹配最专业 Agent，禁止用通用 Agent 包办
- **第 6 步强制** — 所有面向人的输出必须经过互联网风格检索与润色
- **递归调度** — 即使单任务也提示 Agent 继续拆解子任务

---

## 核心文件说明

| 文件 | 说明 |
|------|------|
| `SKILL.md` | 技能主定义文件，包含完整的调度流程和 300+ 场景的 Agent 匹配速查表 |
| `deploy.sh` | 一键部署脚本（Linux/macOS） |
| `agents/*.md` | 215 个可调度专业 AI 智能体 |
