# Claude Code Agent Execution Protocol

## MANDATORY: Single Agent Workflow

### Execution Rules
- **ONE AGENT PER REQUEST** - Run exactly 1 agent, then stop
- **FULL OUTPUT DISPLAY** - Show complete agent response
- **HUMAN DECIDES NEXT** - Wait for human direction after each agent

### Agent Execution Pattern

**When human requests agent work:**
1. Automatically select the most appropriate agent for the task
2. Run that single agent
3. Display the **COMPLETE** agent output
4. Stop and wait for human to decide next steps

### After Agent Completes

**MANDATORY ACTIONS:**
1. **SHOW FULL OUTPUT** - Display everything the agent produced
2. **NO SUMMARIZATION** - Human needs complete context
3. **ASK FOR VALIDATION** - Explicitly ask "Do you approve this output before proceeding?"
4. **STOP AND WAIT** - Do not run additional agents until human approves
5. **Let human choose** - They decide what to do with the results

### Why This Approach Works
- Human sees all agent recommendations and options
- Human maintains full control over the workflow
- No complex validation hooks needed
- Clear stopping points for decision making

## Command Execution

When executing `/project:` commands:
1. Read the command file
2. Follow its validation gates
3. Apply the agent validation protocol above
4. Proceed sequentially through phases

## Quick Reference

**Agents available:**
- `requirements-architect` - Requirements analysis
- `brainstormer` - Solution exploration
- `system-designer` - Architecture design
- `implementation-planner` - Sprint planning
- `code-architect` - Code generation
- `qa-agent` - Testing strategy
- `tdd-coordinator` - TDD orchestration
- `optimization-agent` - Performance analysis
- `data-scientist` - Data analysis
- `model-engineer` - ML architecture
- `insights-visualizer` - Dashboards

**Remember:** This file defines mandatory behavior when working with agents. The human MUST see complete agent outputs to make valid decisions.