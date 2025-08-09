# Claude Code Multi-Agent System - Usage Examples

## 📋 Copy to New Project (Quick Start)

To use this system in a new project:
```bash
# Copy the essential .claude directory (contains all subagents)
cp -r .claude/ your-new-project/
cp USAGE_EXAMPLES.md your-new-project/

# Start using immediately with native Claude Code subagents
cd your-new-project
claude "Build a customer sentiment analysis API"  # Auto-delegates to appropriate agents
claude "@brainstormer: Generate 3 solution approaches for real-time processing"
```
See `TEMPLATE_SETUP.md` for details.

---

## ✅ Setup Complete!

Your Multi-Agent AI Development System uses **native Claude Code subagents** with automatic delegation and **human checkpoint validation**. Claude Code will intelligently route tasks to the most appropriate specialized agent based on your request, while automatically requesting human approval for resource-intensive operations.

## 🚀 How It Works

### 1. **Native Subagent Delegation with Checkpoint Protection** 
Claude Code automatically delegates tasks to specialized agents based on:
- Task description analysis and context understanding  
- Agent capability matching and expertise alignment
- Automatic routing without manual intervention required
- **Human checkpoint validation** for resource-intensive operations (ML training, data processing, destructive commands)

### 2. **Two Primary Usage Modes**

#### A. **Automatic Delegation with Checkpoints** (Recommended)
```bash
# Claude Code automatically selects the best agent and validates resource usage
claude "I need to build a customer sentiment analysis API"
# → Auto-delegates through multiple agents for complete development
# → Requests approval for ML model training or data processing steps

claude "Generate test cases for this user authentication endpoint"  
# → Auto-delegates to @qa-agent (proceeds automatically for safe operations)

claude "What's the best architecture for processing 1M requests/day?"
# → Auto-delegates to @brainstormer and @system-designer
# → May request approval for external research or resource-intensive analysis
```

#### B. **Explicit Agent Invocation**
```bash
# Directly invoke specific agents using @ syntax
claude "@system-designer: Design Clean Architecture for microservices"
claude "@data-scientist: Analyze customer behavior patterns in this dataset" 
claude "@code-architect: Generate user service with Clean Architecture principles"
```

#### C. **Complete Workflow Commands**
```bash
# Use the full workflow slash command for complex projects
claude "/project:full-workflow Create a real-time recommendation engine with ML pipeline"
# → Orchestrates all 4 phases with proper agent handoffs and human checkpoints

# Use TDD-focused workflow for FastAPI microservices
claude "/project:tdd-microservice Create a user management service with authentication and CRUD"
# → TDD-first development with Given-When-Then testing and Clean Architecture
```

## 🛡️ Human Checkpoint System

The system automatically validates operations and requests human approval for:

### **Resource-Intensive Operations (Require Approval):**
```bash
# ML/Data Science operations
claude "Train a neural network on customer data"
# → 🔬 ML/Data Science Operation Detected: Review resource requirements

claude "Process this large dataset for insights" 
# → 🔬 Data processing detected: Confirm compute resource usage

# Destructive operations  
claude "Clean up old model files with rm -rf models/"
# → ⚠️ Destructive Operation Detected: Review deletion command

# External requests
claude "Search for latest ML research papers"
# → 🌐 External Web Request: May incur costs or share data
```

### **Safe Operations (Proceed Automatically):**
```bash
# Regular development tasks
claude "Create a utility function for data validation"
claude "Generate test cases for the API endpoint" 
claude "Write documentation for the authentication flow"
# → These proceed without confirmation
```

### **Checkpoint Override:**
If you need to bypass checkpoints for trusted operations, you can modify `.claude/claude_checkpoint.sh` to customize the validation logic.

## 📋 Quick Test Examples

Try these commands to test your setup:

### Automatic Delegation Tests
```bash
# Test automatic agent selection
claude "Generate 3 solution approaches for real-time data processing"  # → @brainstormer
claude "Analyze requirements for a CRM lead scoring system"  # → @requirements-architect  
claude "Design architecture for high-throughput API"  # → @system-designer
claude "Generate Clean Architecture scaffold for authentication"  # → @code-architect
```

### Explicit Agent Commands  
```bash
# Direct agent invocation using @ syntax
claude "@brainstormer: Explore approaches for distributed caching"
claude "@system-designer: Design microservices for e-commerce order processing"
claude "@tdd-coordinator: Orchestrate TDD workflow for user authentication service"
claude "@qa-agent: Design Given-When-Then tests for FastAPI endpoints"
claude "@data-scientist: Analyze customer transaction patterns for insights"
claude "@insights-visualizer: Create dashboard for ML model performance monitoring"
```

### Complete Workflow Tests
```bash
# Full 4-phase workflow orchestration
claude "/project:full-workflow Build a recommendation engine for e-commerce platform"
claude "/project:full-workflow Create automated customer support chatbot with NLP"  

# TDD-focused FastAPI microservice workflows
claude "/project:tdd-microservice Create order processing service with inventory validation"
claude "/project:tdd-microservice Build user authentication service with JWT and roles"
```

## 🧠 Intelligent Routing Logic

The system automatically detects task types based on keywords:

| Task Type | Keywords | Routes To |
|-----------|----------|-----------|
| **Requirements** | "requirements", "specifications", "business needs" | @requirements |
| **Solution Exploration** | "ideas", "approaches", "alternatives", "brainstorm" | @brainstormer |  
| **Architecture Design** | "architecture", "system design", "clean architecture" | @architect |
| **Implementation Planning** | "implementation plan", "sprint planning", "timeline" | @planner |
| **Code Generation** | "code", "implement", "generate", "scaffold" | @code-architect |
| **TDD Development** | "TDD", "test-driven", "red-green-refactor" | @tdd-coordinator |
| **Testing & QA** | "testing", "test cases", "quality assurance", "given-when-then" | @qa-agent |
| **Data Analysis** | "data analysis", "EDA", "feature engineering" | @data-scientist |
| **Machine Learning** | "ML model", "training pipeline", "algorithm" | @model-engineer |
| **Visualization** | "dashboard", "visualization", "monitoring" | @visualizer |
| **Optimization** | "performance", "optimization", "scalability" | @optimizer |
| **Complete Projects** | "build system", "end-to-end", "complete project" | @workflow |

## 🎯 Real-World Usage Scenarios

### Scenario 1: New Feature Development
```bash
claude "I need to add real-time notifications to our CRM system"
# → Routes to @brainstormer for solution exploration
# → Follow up with specific agents as needed
```

### Scenario 2: Architecture Review
```bash
claude "@architect: Review this microservices design for scalability issues"
# → Direct routing to system designer for expert analysis
```

### Scenario 3: TDD FastAPI Development
```bash
claude "Build user authentication API with test-driven development"
# → Routes to @tdd-coordinator for TDD workflow orchestration
```

### Scenario 4: Performance Optimization
```bash
claude "Our API response times are slow, how can we optimize?"
# → Routes to @optimizer for performance analysis
```

## 🔧 Configuration Customization

### Modify Agent Behavior
Each agent can be customized by editing their configuration:
```bash
# Customize brainstormer for your specific domain
nano .claude/agents/brainstormer.md

# Adapt TDD coordinator for specific testing frameworks
nano .claude/agents/tdd-coordinator.md

# Adapt requirements architect for industry compliance
nano .claude/agents/requirements-architect.md
```

### Add New Workflow Commands
Create custom slash commands:
```bash
# Create new workflow command
nano .claude/commands/custom-workflow.md
```

### Global System Behavior
Customize overall system behavior via Claude Code settings:
```bash
nano .claude/settings.local.json  # Edit Claude Code configuration
```

## ✅ Verification Commands

Test that everything is working:

```bash
# Verify agent configurations exist
ls .claude/agents/*.md

# Test automatic delegation
claude "Generate test cases for user authentication" # Should route to @qa-agent

# Test explicit agent invocation
claude "@tdd-coordinator: Help me set up TDD workflow"

# Test workflow commands
claude "/project:tdd-microservice Create a simple CRUD service"
```

## 🎉 You're Ready!

Your Claude Code Multi-Agent System is fully operational. You can now:

1. **Use Claude Code normally** - it will automatically route to appropriate agents
2. **Explicitly call specific agents** using `@agent:` syntax  
3. **Run complete workflows** using the orchestrator for complex projects
4. **Customize agents** by editing their configuration files

The system follows the 4-phase development process (Initial Scoping → System Design → Execution → Hand-off & Monitoring) with human checkpoints and quality gates throughout.