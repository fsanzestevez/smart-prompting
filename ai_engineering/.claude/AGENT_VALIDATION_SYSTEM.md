# Agent Validation System

## Overview

This system implements **automatic human validation checkpoints** after each agent completes its task in the Claude Code workflow. It ensures human oversight at every critical step while maintaining workflow efficiency.

## Components

### 1. Validation Hook Script
**Location**: `.claude/agent_validation_hook.sh`

The validation hook provides:
- **Visual agent output summary** with phase identification
- **Interactive validation options**:
  - `[A]pprove` - Accept output and continue
  - `[R]evise` - Request agent revision with feedback
  - `[S]top` - Halt workflow for manual intervention
  - `[D]etails` - View detailed agent output
- **Color-coded terminal interface** for clarity
- **Validation criteria checklist**:
  - Output Quality
  - Technical Accuracy
  - Completeness
  - Risk Assessment

### 2. Settings Configuration
**Location**: `.claude/settings.local.json`

Configures:
- **PostTask Hook**: Triggers validation after each agent task
- **Blocking Mode**: Ensures validation before proceeding
- **Validation Levels**:
  - `critical`: High-risk agents (model-engineer, code-architect, tdd-coordinator)
  - `standard`: Planning agents (brainstormer, requirements-architect, etc.)
  - `review`: Analysis agents (qa-agent, data-scientist, etc.)
- **Checkpoint Mapping**: Links agents to workflow diagram checkpoints (H0-H7)

## How It Works

### Automatic Triggering
1. Agent completes a task via the Task tool
2. PostTask hook automatically fires
3. Validation script displays agent output summary
4. Human reviews and provides decision
5. Workflow continues based on validation result

### Example Flow
```bash
# When you run:
claude "@brainstormer: Generate solution approaches for API design"

# The system will:
1. Execute the brainstormer agent
2. Display completion summary:
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   🤖 AGENT TASK COMPLETED
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   Agent: brainstormer
   Task: Generate solution approaches for API design
   Phase: Phase 1: Initial Scoping

3. Request validation:
   🔍 HUMAN VALIDATION REQUIRED
   
   Please review the agent's output above and validate:
   1. Output Quality - Does it meet requirements?
   2. Technical Accuracy - Are the recommendations sound?
   3. Completeness - Are all aspects addressed?
   4. Risk Assessment - Are risks properly identified?
   
   Options:
   [A]pprove - Accept output and continue
   [R]evise - Request agent to revise with feedback
   [S]top - Stop workflow for manual intervention
   [D]etails - View detailed agent output
   
   Your decision [A/R/S/D]: 
```

## Integration with Workflow Phases

The validation system aligns with the 4-phase workflow:

### Phase 1: Initial Scoping
- `requirements-architect` → H0_REQ checkpoint
- `brainstormer` → H0_BRAIN checkpoint
- `data-scientist` → H2_DATA checkpoint

### Phase 2: System Design
- `system-designer` → H3 checkpoint
- `model-engineer` → H2_MODEL checkpoint
- `implementation-planner` → H2_PLAN checkpoint

### Phase 3: Execution
- `tdd-coordinator` → H4 checkpoint
- `code-architect` → H5 checkpoint
- `qa-agent` → H5 checkpoint
- `insights-visualizer` → H5 checkpoint

### Phase 4: Optimization
- `optimization-agent` → H7 checkpoint

## Benefits

1. **Quality Assurance**: Every agent output is reviewed before proceeding
2. **Risk Mitigation**: Critical agents get extra scrutiny
3. **Feedback Loop**: Revision requests improve agent performance
4. **Workflow Control**: Ability to stop and intervene when needed
5. **Audit Trail**: All validations are logged for compliance
6. **Phase Awareness**: Validation context includes workflow phase

## Usage Examples

### Full Workflow with Validation
```bash
claude "/project:full-workflow Create customer API"
# Each agent in the workflow will trigger validation
```

### Individual Agent with Validation
```bash
claude "@system-designer: Design microservices architecture"
# Validation checkpoint after system designer completes
```

### Handling Validation Decisions

**Approve**: Agent output meets all criteria
```
Your decision [A/R/S/D]: A
✓ Output approved. Proceeding to next step.
```

**Revise**: Agent needs to refine output
```
Your decision [A/R/S/D]: R
Enter feedback for the agent: Need more detail on security considerations
⟲ Revision requested.
Feedback recorded: Need more detail on security considerations
```

**Stop**: Manual intervention required
```
Your decision [A/R/S/D]: S
⛔ Workflow stopped for manual intervention.
```

## Customization

### Modifying Validation Criteria
Edit `.claude/agent_validation_hook.sh` to add custom validation checks:
```bash
# Add custom validation questions
echo -e "  ${GREEN}5.${NC} Custom Check - Does it meet company standards?"
```

### Adjusting Validation Levels
Edit `.claude/settings.local.json` to recategorize agents:
```json
"validation_levels": {
  "critical": ["your-critical-agents"],
  "standard": ["your-standard-agents"],
  "review": ["your-review-agents"]
}
```

### Disabling for Specific Agents
To skip validation for certain agents, modify the hook script:
```bash
# Skip validation for specific agents
if [[ "$agent_name" == "non-critical-agent" ]]; then
    return 0
fi
```

## Troubleshooting

### Hook Not Triggering
- Ensure script is executable: `chmod +x .claude/agent_validation_hook.sh`
- Check settings.local.json is properly formatted
- Verify PostTask hook is configured

### Validation Timeout
- Default timeout is 300 seconds (5 minutes)
- Adjust in settings.local.json: `"approval_timeout": 600`

### Agent Name Mismatch
- Ensure agent names in checkpoint_mapping match actual agent names
- Check for typos in agent definitions

## Best Practices

1. **Review Thoroughly**: Take time to validate agent outputs properly
2. **Provide Clear Feedback**: When requesting revisions, be specific
3. **Document Decisions**: Keep notes on why outputs were approved/rejected
4. **Monitor Patterns**: Track common revision requests to improve agents
5. **Update Regularly**: Refine validation criteria based on experience

## Future Enhancements

- [ ] Integration with external review systems
- [ ] Automated validation for certain criteria
- [ ] Validation history and analytics
- [ ] Team-based validation workflows
- [ ] Custom validation rules per project
- [ ] Integration with CI/CD pipelines