# 📋 Quick Setup for New Projects

## Copy These Files to Your New Project:

```bash
# Essential: Native Claude Code subagents (required)
cp -r .claude/ your-new-project/

# Documentation (recommended) 
cp USAGE_EXAMPLES.md your-new-project/
cp README.md your-new-project/
```

## Immediate Usage:
```bash
cd your-new-project

# Automatic delegation
claude "Build a customer sentiment analysis API"

# Explicit agent invocation
claude "@brainstormer: Generate 3 approaches for real-time data processing"

# Complete workflow
claude "/project:full-workflow Create a recommendation engine with ML pipeline"

# TDD-focused FastAPI microservice workflow
claude "/project:tdd-microservice Create a user management service with authentication"
```

## What You Get:
- **11 Specialized Subagents** with native Claude Code integration (includes TDD coordinator)
- **Automatic task delegation** based on context analysis
- **Human checkpoint validation** for resource-intensive operations (automatic via hooks)
- **4-Phase workflow orchestration** via `/project:full-workflow` command
- **TDD-focused FastAPI development** via `/project:tdd-microservice` command
- **Individual agent access** via `@agent-name:` syntax
- **Cost protection** for ML operations, destructive commands, and external requests

## Reference Materials (Stay Here):
- `reference_materials/` - Keep in this template directory for consultation
- Contains original agent specifications, workflow diagrams, and methodology
- Use when customizing agents or understanding the system architecture

## Checkpoint System:
- **Automatic validation** for expensive operations (ML training, data processing, destructive commands)
- **Human approval required** for resource-intensive tasks regardless of how Claude is invoked
- **Customizable** via `.claude/claude_checkpoint.sh` script
- See `.claude/CHECKPOINT_SYSTEM.md` for detailed documentation

That's it! Claude Code will automatically delegate to the right agents with built-in cost protection. See `USAGE_EXAMPLES.md` for complete usage guide.