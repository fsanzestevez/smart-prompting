# 🎯 Claude Code Multi-Agent Development System - Project Template

## 📁 Native Claude Code Subagent Implementation

This directory contains a production-ready **Native Claude Code Subagent System** with 10 specialized agents that work together in a 4-phase development workflow. Perfect for copy-paste reuse in new projects.

### ✅ **Copy to New Project (Required):**

```bash
# Just copy the .claude directory - that's it!
cp -r .claude/ your-new-project/
cd your-new-project

# Start using immediately
claude "Build a customer sentiment analysis API"  # Auto-delegates to appropriate agents
claude "@brainstormer: Generate 3 approaches for real-time processing"
claude "/project:full-workflow Create a recommendation engine with ML pipeline"
```

### 📚 **Optional Documentation (Recommended):**

```bash
# Copy for reference and understanding
cp README.md your-new-project/                    # System overview and architecture
cp USAGE_EXAMPLES.md your-new-project/            # Complete usage guide
cp TEMPLATE_SETUP.md your-new-project/            # Quick setup instructions
```

### 🔍 **Reference Materials (Keep Here for Consultation):**

These files stay in the template directory for reference when customizing:

```bash
reference_materials/
├── agent_specifications/        # Original agent prompt templates (for customization)
├── workflow_diagrams/          # Visual workflow representations
├── claude_code_agent_generation_thread.md  # Implementation methodology
└── original_thread_examples/   # Example configurations from development
```

## 🚀 **What You Get After Copying:**

### Native Claude Code Integration
- **10 Specialized Subagents** with automatic task delegation
- **YAML Frontmatter Format** following Claude Code standards
- **Independent Context Windows** for each agent
- **Native @agent Syntax** for direct agent invocation
- **Slash Commands** for workflow orchestration

### Available Agents
- **@brainstormer** - Creative solution exploration and technical ideation
- **@requirements-architect** - Business-to-technical requirements translation  
- **@system-designer** - Clean Architecture blueprint creation
- **@implementation-planner** - Sprint strategy and resource optimization
- **@code-architect** - TDD-first Clean Architecture scaffold generation
- **@qa-agent** - FastAPI testing with Given-When-Then structure
- **@tdd-coordinator** - TDD workflow orchestration specialist
- **@optimization-agent** - Performance analysis and improvements
- **@data-scientist** - EDA and feature engineering
- **@model-engineer** - ML architecture and training pipelines
- **@insights-visualizer** - Dashboard and monitoring systems

### Workflow Commands
- **`/project:full-workflow [description]`** - Complete 4-phase development workflow
- **`/project:tdd-microservice [description]`** - TDD-focused FastAPI microservice development
- **Automatic delegation** - Claude Code intelligently routes tasks to appropriate agents
- **Human checkpoints** - Strategic decision points throughout the workflow

## 💡 **Usage Patterns:**

### 1. Automatic Delegation (Recommended)
```bash
claude "I need to build a real-time fraud detection system"
# → Claude Code automatically delegates to multiple agents as needed
```

### 2. Explicit Agent Invocation
```bash
claude "@system-designer: Design Clean Architecture for processing 1M requests/day"
claude "@data-scientist: Analyze customer behavior patterns in this dataset"
claude "@code-architect: Generate user authentication service with Clean Architecture"
```

### 3. Complete Workflow Orchestration
```bash
claude "/project:full-workflow Build a customer churn prediction system with real-time API and monitoring dashboard"
# → Orchestrates all 4 phases: Scoping → Design → Execution → Monitoring

claude "/project:tdd-microservice Create a user management service with CRUD operations and email validation"
# → TDD-focused FastAPI microservice with Clean Architecture and Given-When-Then testing
```

## 🎨 **Customization Options:**

### Modify Individual Agents
```bash
# Edit agent configurations (YAML frontmatter + system prompt)
nano .claude/agents/brainstormer.md
nano .claude/agents/system-designer.md
```

### Create New Agents
```bash
# Use existing agents as templates
cp .claude/agents/brainstormer.md .claude/agents/custom-specialist.md
# Edit YAML frontmatter (name, description, tools, model)
```

### Add New Workflow Commands
```bash
# Create custom slash commands
nano .claude/commands/custom-workflow.md
```

## 🔥 **Key Benefits:**

✅ **Zero Setup Time** - Copy `.claude/` and start using immediately  
✅ **Native Claude Code** - Uses official subagent implementation  
✅ **Automatic Delegation** - No manual routing required  
✅ **Clean Architecture** - Embedded best practices throughout  
✅ **TDD-First Development** - Red-Green-Refactor cycles with FastAPI testing
✅ **4-Phase Workflow** - Complete development lifecycle coverage  
✅ **ML/AI Integration** - Built-in data science and ML capabilities  
✅ **Human Oversight** - Strategic checkpoints for quality assurance  
✅ **Highly Customizable** - Easy to modify agents and workflows  

## 📋 **Template Directory Structure:**

```
ai_engineering/ (This template)
├── .claude/                     # ← Copy this to your new project
│   ├── agents/                  #   11 specialized subagents (includes TDD coordinator)
│   └── commands/                #   Workflow orchestration commands (full-workflow, tdd-microservice)
├── README.md                    # System documentation (optional copy)
├── USAGE_EXAMPLES.md            # Complete usage guide (optional copy)
├── TEMPLATE_SETUP.md            # Quick setup instructions (optional copy)
├── PROJECT_TEMPLATE_README.md   # This file (don't copy)
└── reference_materials/         # Reference docs (keep here for consultation)
    ├── agent_specifications/    #   Original agent prompts for customization
    ├── workflow_diagrams/       #   Visual workflow representations
    └── claude_code_agent_generation_thread.md  # Implementation methodology
```

---

**Ready to revolutionize your development workflow with native Claude Code subagents! 🚀**

Copy the `.claude/` directory to any project and start building with AI-powered multi-agent assistance.