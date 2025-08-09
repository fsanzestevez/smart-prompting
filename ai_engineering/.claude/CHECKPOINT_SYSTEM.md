# Claude Code Human Checkpoint System

## 🎯 Overview

This system enforces human approval for resource-intensive operations and critical workflow steps, regardless of how Claude Code routes tasks (automatic delegation, explicit agent calls, or workflow commands).

## ⚙️ How It Works

### Hook System
- **PreToolUse Hook**: Intercepts every tool call before execution
- **Smart Analysis**: Evaluates operations for resource intensity, cost, and risk
- **Human Confirmation**: Forces approval for flagged operations via Claude Code UI

### Checkpoint Categories

#### 🔬 **ML/Data Science Operations**
- Python ML training scripts (`python train_model.py`)
- Data processing operations (`python analyze_data.py`) 
- Jupyter notebook execution
- ML library installations (tensorflow, torch, sklearn)

#### ⚠️ **Destructive Operations**
- File deletion commands (`rm -rf`, `delete`, `drop`, `truncate`)
- Database operations that modify data
- System configuration changes

#### 📦 **Resource-Intensive Operations**
- Package installations (`npm install`, `pip install`)
- Large file operations
- External service calls

#### 🔧 **Critical File Modifications**
- `.claude/` configuration files
- `requirements.txt`, `pyproject.toml`, `package.json`
- `Dockerfile` and deployment configs

#### 🌐 **External Requests**
- Web searches and external API calls
- Operations that may incur costs or share data

## 🚀 Usage Examples

### Automatic Checkpoint Triggering

```bash
# This will trigger human confirmation:
claude "Train a neural network on customer data"
# → Hook detects ML operation → Asks for approval

# This will also trigger confirmation:
claude "@data-scientist: Analyze this large dataset"  
# → Hook detects data science agent → Asks for approval

# Safe operation proceeds without confirmation:
claude "Create a simple utility function"
# → Hook allows regular code generation
```

### Workflow Integration

The checkpoint system works with all usage modes:

1. **Automatic Delegation**: Intercepts resource-intensive operations
2. **Explicit Agent Calls**: Validates expensive agent operations  
3. **Workflow Commands**: Enforces checkpoints within `/project:full-workflow`

## 🔧 Configuration

### Location
- **Hook Configuration**: `.claude/settings.local.json`
- **Checkpoint Script**: `.claude/claude_checkpoint.sh`

### Customization

**Add New Operation Patterns:**
Edit `claude_checkpoint.sh` and add patterns to the case statements:

```bash
# Add custom expensive operations
if echo "$COMMAND" | grep -qE "(your_expensive_command|another_pattern)"; then
    REQUIRE_CONFIRMATION=true
    REASON="Custom expensive operation detected"
fi
```

**Modify Confirmation Triggers:**
- Change `REQUIRE_CONFIRMATION=true` to `false` to disable specific checks
- Customize `REASON` messages for better context
- Add new tool types to the case statement

## ✅ Testing

Run the test script to validate checkpoint behavior:

```bash
cd .claude
./test_checkpoint.sh
```

Expected results:
- ✅ Safe operations: `"permissionDecision": "allow"`
- ❓ Risky operations: `"permissionDecision": "ask"`

## 💡 Benefits

### For ML Projects
- **Cost Control**: Prevents accidental expensive training jobs
- **Resource Awareness**: Forces consideration of GPU/compute costs
- **Data Safety**: Confirms before processing sensitive datasets

### For System Operations  
- **Configuration Safety**: Prevents accidental system changes
- **Data Protection**: Confirms destructive operations
- **External Request Control**: Manages API costs and data sharing

### For Team Workflows
- **Consistent Checkpoints**: Works regardless of how Claude is invoked
- **Audit Trail**: All resource-intensive operations require human decision
- **Risk Management**: Systematic evaluation of operation impact

## 🔒 Security Notes

- The checkpoint script has access to tool call parameters
- Ensure the script has appropriate file permissions (`chmod +x`)
- Review the script logic before deployment in production environments
- Consider logging checkpoint decisions for audit purposes

## 🎯 Integration with ML Workflow

This system complements our ML workflow checkpoints:
- **H2_DATA**: Data strategy validation → Checkpoint enforces EDA cost awareness
- **H2_MODEL**: ML architecture approval → Checkpoint enforces training cost awareness  
- **H2_PLAN**: Implementation plan approval → Checkpoint enforces resource allocation

The hook system provides **automatic enforcement** of the human oversight designed into our agent workflow system.