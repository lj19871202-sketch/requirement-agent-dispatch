#!/bin/bash
# ============================================================
# Requirement Agent Dispatch Skill — 一键部署脚本
# One-Click Deployment Script
# ============================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_NAME="requirement-agent-dispatch"

echo "========================================"
echo "  需求分析与智能体调度 Skill 部署"
echo "  Requirement Agent Dispatch Deployment"
echo "========================================"

# --- 检测目标目录 ---
if [ -d "$HOME/.config/opencode/skills" ]; then
  TARGET_SKILLS="$HOME/.config/opencode/skills"
elif [ -d "$HOME/.opencode/skills" ]; then
  TARGET_SKILLS="$HOME/.opencode/skills"
else
  echo "[INFO] 未检测到现有 skills 目录，创建: $HOME/.config/opencode/skills"
  mkdir -p "$HOME/.config/opencode/skills"
  TARGET_SKILLS="$HOME/.config/opencode/skills"
fi

# --- 检测 agents 目录 ---
if [ -d "$HOME/.opencode/agents" ]; then
  TARGET_AGENTS="$HOME/.opencode/agents"
else
  echo "[INFO] 未检测到 agents 目录，创建: $HOME/.opencode/agents"
  mkdir -p "$HOME/.opencode/agents"
  TARGET_AGENTS="$HOME/.opencode/agents"
fi

echo ""
echo "[1/3] 部署 Skill 文件..."
mkdir -p "$TARGET_SKILLS/$SKILL_NAME"
cp "$SCRIPT_DIR/SKILL.md" "$TARGET_SKILLS/$SKILL_NAME/"
echo "  ✓ SKILL.md → $TARGET_SKILLS/$SKILL_NAME/"

echo ""
echo "[2/3] 部署 Agents 到全局目录..."
cp "$SCRIPT_DIR"/agents/*.md "$TARGET_AGENTS/"
echo "  ✓ $(ls "$SCRIPT_DIR/agents/"*.md 2>/dev/null | wc -l) 个 Agent 已部署到:"
echo "    - $TARGET_AGENTS/"

echo ""
echo "[3/3] 验证部署..."
if [ -f "$TARGET_SKILLS/$SKILL_NAME/SKILL.md" ]; then
  echo "  ✓ Skill 文件存在"
else
  echo "  ✗ Skill 文件缺失！"
  exit 1
fi
AGENT_COUNT=$(ls "$TARGET_AGENTS/"*.md 2>/dev/null | wc -l)
echo "  ✓ 当前 agents 总数: $AGENT_COUNT"

echo ""
echo "========================================"
echo "  部署完成！Deployment Complete!"
echo "========================================"
echo ""
echo "使用方法 / Usage:"
echo "  1. 重启/重载 OpenCode"
echo "  2. 描述需求即可自动触发智能体调度"
echo "     或输入 /skills 查看已加载的技能"
