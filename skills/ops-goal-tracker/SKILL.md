---
name: ops-goal-tracker
description: OPS Goal 推进引擎 — 需求评估→任务拆解→增量实施→每周报告→检查点→结果验证。贯穿 OPS 六阶段，确保每个任务可跟踪可验证。
---

# OPS Goal 推进引擎

## 触发词
"推进"、"进度"、"周报"、"检查点"、"拆解"、"Goal推进"、"评估需求"、"任务分解"

## 六步闭环

### ① 需求评估
PRD → interview-me → idea-refine → GOAL_REQ 评估报告

### ② 任务拆解
planning-and-task-breakdown → 依赖图 → 垂直切片 → GOAL_TASK 清单

### ③ 增量实施
incremental-implementation → 薄切片 → 原子提交 → Feature Flag

### ④ 每周报告
每周一自动生成 → GOAL_WEEKLY → 进度/阻塞/趋势

### ⑤ 检查点
每 Phase 结束 → GOAL_CHECKPOINT → 不通过不进下一阶段

### ⑥ 结果验证
版本结束 → GOAL_RESULT → 计划 vs 实际对比

## 稳定性指标
- 任务按期完成率 ≥ 85%
- 阻塞平均解除 ≤ 2天
- 计划偏差率 ≤ 15%
- 周报准时率 = 100%
