# Sequential Multi-Agent Development Workflow with Mandatory Approval Gates

## 🛑 MANDATORY AGENT VALIDATION PROTOCOL

### Before EVERY Agent Execution:
```
🤖 AGENT REQUEST
================
Agent: [agent-type]
Task: [description]
Purpose: [what we're achieving]

➡️ Approve this agent? (yes/no)
```

**I MUST**:
1. STOP and present the above request
2. WAIT for explicit approval (yes/proceed/go ahead)
3. ABORT if user says no or provides different instructions

### After EVERY Agent Completion:

**I MUST**:
1. DISPLAY the FULL agent output (no summarization)
2. WAIT for user to review all options/recommendations
3. ASK: "➡️ How would you like to proceed?"
4. ONLY continue after user provides direction

**CRITICAL**: 
- NEVER summarize agent outputs
- ALWAYS show complete results including all options
- Let USER choose from agent-provided options

## ⚠️ CRITICAL EXECUTION RULES
1. **STRICTLY SEQUENTIAL**: Each step MUST complete before the next begins
2. **MANDATORY APPROVAL**: Human approval is REQUIRED at every checkpoint - no skipping
3. **STATE TRACKING**: System must maintain execution state and prevent out-of-order execution
4. **BLOCKING GATES**: Workflow halts completely until approval is received
5. **NO PARALLEL AGENTS**: One agent at a time only
6. **FULL OUTPUT DISPLAY**: Never summarize agent results - show everything

## Workflow State Management
```yaml
workflow_state:
  current_phase: [1|2|3|4]
  current_step: string
  completed_steps: []
  pending_approval: boolean
  approval_history: []
  blocked_reason: string
```

---

## PHASE 1: Initial Scoping [SEQUENTIAL]

### Execution Order (NO PARALLELIZATION):

1. **[STEP 1.1]** Requirements Analysis
   - Agent: `@requirements-architect`
   - Action: Analyze business needs
   - Output: requirements_doc.md
   - **→ HALT: Awaiting H0_REQ approval**

2. **[GATE H0_REQ]** Requirements Review ⛔
   ```
   APPROVAL REQUIRED:
   - Review: requirements_doc.md
   - Options: [APPROVE | REJECT | REVISE]
   - If REJECT/REVISE → Return to Step 1.1
   ```

3. **[STEP 1.2]** Solution Exploration  
   - Agent: `@brainstormer`
   - Prerequisite: H0_REQ approved
   - Action: Generate technical approaches
   - Output: solutions_matrix.md
   - **→ HALT: Awaiting H0_BRAIN approval**

4. **[GATE H0_BRAIN]** Solution Validation ⛔
   ```
   APPROVAL REQUIRED:
   - Review: solutions_matrix.md
   - Options: [APPROVE | REJECT | REQUEST_MORE]
   - If REJECT/REQUEST_MORE → Return to Step 1.2
   ```

5. **[STEP 1.3]** Data Assessment
   - Agent: `@data-scientist`
   - Prerequisite: H0_BRAIN approved
   - Action: Preliminary EDA and feature analysis
   - Output: data_assessment.md
   - **→ HALT: Awaiting H1 approval**

6. **[GATE H1]** Phase 1 Final Approval ⛔
   ```
   APPROVAL REQUIRED:
   - Review: All Phase 1 outputs
   - Options: [PROCEED_TO_PHASE_2 | RESTART_PHASE_1]
   - If RESTART → Return to Step 1.1
   ```

---

## PHASE 2: System Design with ML Validation [SEQUENTIAL]

### Execution Order (STRICTLY ORDERED):

1. **[STEP 2.1]** Architecture Design
   - Agent: `@system-designer`
   - Prerequisite: H1 approved
   - Action: Create Clean Architecture blueprints
   - Output: architecture_design.md
   - **→ HALT: Awaiting H2_ARCH approval**

2. **[GATE H2_ARCH]** Architecture Approval ⛔
   ```
   APPROVAL REQUIRED:
   - Review: architecture_design.md
   - Options: [APPROVE | MODIFY | REJECT]
   - If MODIFY/REJECT → Return to Step 2.1
   ```

3. **[STEP 2.2]** Data Strategy Planning
   - Agent: `@data-scientist`
   - Prerequisite: H2_ARCH approved
   - Action: Propose EDA with cost/time estimates
   - Output: data_strategy.md, cost_estimates.yaml
   - **→ HALT: Awaiting H2_DATA approval**

4. **[GATE H2_DATA]** Data Strategy Approval ⛔
   ```
   APPROVAL REQUIRED:
   - Review: data_strategy.md, cost_estimates.yaml
   - Validate: Budget constraints, timeline feasibility
   - Options: [APPROVE | SCALE_DOWN | REJECT]
   - If SCALE_DOWN/REJECT → Return to Step 2.2
   ```

5. **[STEP 2.3]** ML Architecture Design
   - Agent: `@model-engineer`
   - Prerequisite: H2_DATA approved
   - Action: Design training pipelines and model architecture
   - Output: ml_architecture.md, resource_requirements.yaml
   - **→ HALT: Awaiting H2_MODEL approval**

6. **[GATE H2_MODEL]** ML Architecture Approval ⛔
   ```
   APPROVAL REQUIRED:
   - Review: ml_architecture.md, resource_requirements.yaml
   - Validate: GPU availability, model complexity
   - Options: [APPROVE | SIMPLIFY | REJECT]
   - If SIMPLIFY/REJECT → Return to Step 2.3
   ```

7. **[STEP 2.4]** Implementation Planning
   - Agent: `@implementation-planner`
   - Prerequisite: H2_MODEL approved
   - Action: Create integrated timeline with ML milestones
   - Output: implementation_plan.md, sprint_schedule.yaml
   - **→ HALT: Awaiting H2_PLAN approval**

8. **[GATE H2_PLAN]** Implementation Plan Approval ⛔
   ```
   APPROVAL REQUIRED:
   - Review: implementation_plan.md, sprint_schedule.yaml
   - Validate: Resource allocation, timeline conflicts
   - Options: [APPROVE | ADJUST | REJECT]
   - If ADJUST/REJECT → Return to Step 2.4
   ```

9. **[GATE H3]** Phase 2 Final Review ⛔
   ```
   APPROVAL REQUIRED:
   - Review: Complete design package
   - Options: [PROCEED_TO_PHASE_3 | REVISE_PHASE_2]
   ```

---

## PHASE 3: Execution [SEQUENTIAL]

### Execution Order (NO CONCURRENT EXECUTION):

1. **[STEP 3.1]** Code Scaffolding
   - Agent: `@code-architect`
   - Prerequisite: H3 approved
   - Action: Generate Clean Architecture code structure
   - Output: /src directory structure
   - **→ HALT: Awaiting H5_SCAFFOLD approval**

2. **[GATE H5_SCAFFOLD]** Scaffold Review ⛔
   ```
   APPROVAL REQUIRED:
   - Review: Generated code structure
   - Options: [APPROVE | REGENERATE]
   ```

3. **[STEP 3.2]** Model Integration
   - Agent: `@model-engineer`
   - Prerequisite: H5_SCAFFOLD approved
   - Action: Integrate ML models into production APIs
   - Output: /api/ml_endpoints
   - **→ HALT: Awaiting H5_MODEL approval**

4. **[GATE H5_MODEL]** Model Integration Review ⛔
   ```
   APPROVAL REQUIRED:
   - Review: API endpoints, model serving code
   - Options: [APPROVE | REFACTOR]
   ```

5. **[STEP 3.3]** Dashboard Creation
   - Agent: `@insights-visualizer`
   - Prerequisite: H5_MODEL approved
   - Action: Create monitoring and reporting interfaces
   - Output: /dashboard directory
   - **→ HALT: Awaiting H5_DASH approval**

6. **[GATE H5_DASH]** Dashboard Review ⛔
   ```
   APPROVAL REQUIRED:
   - Review: UI/UX, metrics displayed
   - Options: [APPROVE | ENHANCE]
   ```

7. **[STEP 3.4]** Quality Assurance
   - Agent: `@qa-agent`
   - Prerequisite: H5_DASH approved
   - Action: Execute comprehensive testing
   - Output: test_report.md, coverage_report.html
   - **→ HALT: Awaiting H6 approval**

8. **[GATE H6]** Handoff Decision ⛔
   ```
   APPROVAL REQUIRED:
   - Review: Test results, coverage metrics
   - Options: [PROCEED_TO_PHASE_4 | FIX_ISSUES]
   ```

---

## PHASE 4: Handoff & Monitoring [SEQUENTIAL]

1. **[STEP 4.1]** Performance Analysis
   - Agent: `@optimization-agent`
   - Prerequisite: H6 approved
   - Action: Analyze system bottlenecks
   - Output: performance_report.md
   - **→ HALT: Awaiting H7_PERF approval**

2. **[GATE H7_PERF]** Performance Approval ⛔
   ```
   APPROVAL REQUIRED:
   - Review: Performance metrics
   - Options: [ACCEPT | OPTIMIZE]
   ```

3. **[STEP 4.2]** Production Monitoring Setup
   - Agent: `@insights-visualizer`
   - Prerequisite: H7_PERF approved
   - Action: Deploy monitoring dashboards
   - Output: monitoring_urls.md
   - **→ HALT: Awaiting H7_FINAL approval**

4. **[GATE H7_FINAL]** Final Strategic Alignment ⛔
   ```
   APPROVAL REQUIRED:
   - Review: Complete system
   - Options: [DEPLOY | ITERATE]
   ```

---

## Enforcement Mechanisms

### 1. State Validation Function
```python
def validate_next_step(current_state, requested_step):
    """
    Prevents out-of-order execution
    """
    if not is_prerequisite_met(current_state, requested_step):
        raise BlockedExecutionError(
            f"Cannot execute {requested_step}. "
            f"Waiting for: {get_blocking_approval(current_state)}"
        )
```

### 2. Approval Tracking
```python
approval_log = {
    "timestamp": "ISO-8601",
    "gate_id": "H0_REQ",
    "decision": "APPROVE|REJECT|REVISE",
    "approver": "user_id",
    "comments": "string",
    "artifacts_reviewed": []
}
```

### 3. Rollback Prevention
```yaml
rules:
  - Once approved, a gate cannot be "un-approved"
  - To change, must restart from that point
  - All downstream work is invalidated on rollback
```

---

## Usage Commands

### Start Workflow (Sequential Only)
```bash
/workflow:start --mode=sequential --project="Customer Sentiment Analysis"
```

### Check Current State
```bash
/workflow:status
# Returns: Current phase, step, and pending approval
```

### Submit Approval
```bash
/workflow:approve --gate=H0_REQ --decision=APPROVE --comment="Requirements look good"
```

### Force Sequential Re-check
```bash
/workflow:validate --enforce-sequential
```

---

## Error States

### Blocked Execution
```
ERROR: Cannot proceed to Step 2.3 (ML Architecture)
REASON: Pending approval at Gate H2_DATA
ACTION: Submit approval for H2_DATA before continuing
```

### Out-of-Order Attempt
```
ERROR: Attempted to execute Phase 3 while in Phase 2
REASON: Sequential execution enforced
ACTION: Complete all Phase 2 steps and approvals first
```

### Stale State
```
WARNING: Approval H2_ARCH invalidated due to upstream change
REASON: H1 was revised after H2_ARCH approval
ACTION: Re-approve H2_ARCH with updated context
```