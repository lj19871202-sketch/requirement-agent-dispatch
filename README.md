# requirement-agent-dispatch

需求分析与智能体调度 skill——将用户需求拆解为可执行任务，分派给对应的专业 agent。适用于 [opencode](https://opencode.ai) 环境。

内置 215 专业 agent 场景映射表，支持单智能体、并行、串行、混合、编排者五种调度模式。

## 安装

### 前提条件

- 已安装 [opencode](https://opencode.ai) CLI 工具
- opencode 版本 >= 0.1.0

### 方式一：一键部署（推荐）

克隆仓库并运行部署脚本：

```bash
git clone https://github.com/lj19871202-sketch/requirement-agent-dispatch.git
cd requirement-agent-dispatch
chmod +x deploy.sh
./deploy.sh
```

部署脚本会自动：

1. 检测 `~/.agents/skills/` 目录，将 `SKILL.md` 部署到 `~/.agents/skills/requirement-agent-dispatch/`
2. 检测 `~/.opencode/agents/` 目录，将 `agents/*.md` 部署到全局 agent 目录
3. 验证部署结果

### 方式二：手动部署

```bash
# 部署 skill
mkdir -p ~/.agents/skills/requirement-agent-dispatch
cp SKILL.md ~/.agents/skills/requirement-agent-dispatch/

# 部署 agents（如目录中有 agents 文件）
if [ -d "agents" ]; then
  mkdir -p ~/.opencode/agents
  cp agents/*.md ~/.opencode/agents/
fi
```

### 验证安装

```bash
# 确认 skill 文件存在
ls ~/.agents/skills/requirement-agent-dispatch/
# 应输出: README.md  SKILL.md

# 确认 agents 已部署
ls ~/.opencode/agents/*.md | wc -l
# 应看到 agent 文件

# 重载 opencode 后查看可用 skills
opencode skills list
# 应包含: requirement-agent-dispatch
```

## 使用方式

在 opencode 会话中，当用户提出一个需要拆解为多步执行的需求时，系统会自动检测并提示加载此 skill。

也可以手动加载——在对话中输入描述任务需求的内容即可自动触发智能体调度。

## 核心红线

**加载此技能后必须调用 `Task` 工具**，不得亲自下场做任何专业操作。唯一的例外是遍历全部 agent 后确认无匹配。

## 工作流

1. **需求分析** → 2. **任务分解** → 3. **智能体匹配** → 4. **调度执行** → 5. **结果验证** → 6. **互联网风格检索与润色**

## 前置强制检查

加载 skill 后必须以 JSON 格式输出检查结果，包含 `user_requirement`、`domain_analysis`、`decision`（调度模式）、`dispatch_plan` 和 `step_6_polishing`。

## 五种调度模式

| 模式 | 适用场景 | 说明 |
|------|---------|------|
| 单智能体调度 | 需求单一、领域明确 | 派一个 Task，告知可继续拆解下发 |
| 并行调度 | 多个独立任务 | 同时发多个 Task，互不依赖 |
| 流水线调度（串行） | 任务有顺序依赖 | 前一个输出传递给后一个 |
| 混合调度 | 大需求拆解 | 部分并行、部分串行 |
| 编排者调度 | ≥5 个子任务 | 使用"智能体编排者"作为总调度 |

## 颗粒度铁律

专业 agent 优先于通用 agent。每个子领域必须遍历全部 agent 找到最匹配的专业 agent，不得用通用 agent 包办。

## 第六步（强制）：互联网风格检索与润色

所有面向人阅读的文字产出必须执行：
1. 分析内容主题/行业
2. 搜索互联网上同类型优秀内容的风格
3. 整理"风格参考指南"
4. 派 agent 润色（不得亲自下场）
5. 保持事实准确性不变

## 完成后自检

- 是否真的调用了 `Task()`？
- 每个子任务是否都发给了对应 agent？
- 有没有"觉得简单就自己做了"的情况？
- **是否执行了第 6 步润色？**
- 颗粒度审计是否通过？

## 常见违规模式

- ❌ 自己搜数据+写报告 → ✅ 拆分为多个 agent 执行
- ❌ 用通用 agent 包办专业任务 → ✅ 用最匹配的专业 agent
- ❌ 跳过前置检查 → ✅ 输出 JSON 检查结果
- ❌ 跳过第 6 步润色 → ✅ 派 agent 搜索风格并润色

## 目录结构

```
requirement-agent-dispatch/
├── deploy.sh    # 一键部署脚本
├── README.md    # 本文件
├── SKILL.md     # skill 详细指令（核心文件，150+ 场景 agent 映射表）
└── agents/      # 预置 agent 定义文件（部署至 ~/.opencode/agents/）
```

## 相关资源

- [opencode 官方文档](https://opencode.ai)
- [opencode skills 开发指南](https://opencode.ai/docs/skills)
- [opencode agents 列表](https://github.com/anomalyco/opencode-agents)

## License

MIT
