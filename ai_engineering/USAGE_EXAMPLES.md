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

## 🛡️ Dual Human Validation System

The system provides **two layers of validation** for comprehensive workflow control:

### **1. Operation Checkpoints (PreToolUse Hook)**
Validates operations BEFORE execution:

```bash
# ML/Data Science operations
claude "Train a sentiment analysis model on 50GB of tweets"
# → 🔬 ML Operation Checkpoint: Approve GPU usage? [Y/N]

claude "@model-engineer: Fine-tune BERT on customer feedback" 
# → 🔬 Model Training Checkpoint: Confirm resource allocation [Y/N]

# Destructive operations  
claude "Delete all test databases and reset environment"
# → ⚠️ Destructive Operation: Confirm deletion of test databases [Y/N]

# Package installations
claude "Install tensorflow and pytorch for model comparison"
# → 📦 Package Installation: Approve dependency changes [Y/N]
```

### **2. Output Validation (PostTask Hook)**
Reviews agent deliverables AFTER completion:

```bash
claude "@brainstormer: Design payment processing system"
# Agent completes task...
# → 🔍 HUMAN VALIDATION REQUIRED
#    Agent: brainstormer
#    Phase: Phase 1: Initial Scoping
#    Review output quality [Approve/Revise/Stop/Details]: _

claude "@code-architect: Generate authentication microservice"
# Agent generates code...
# → 🔍 VALIDATION CHECKPOINT
#    Agent: code-architect  
#    Phase: Phase 3: Execution
#    Validate code quality [A/R/S/D]: _
```

### **Combined Validation Flow Example:**
```bash
claude "Build fraud detection system with ML"
# Step 1: Brainstormer generates approaches
# → Output Validation: Review approaches [A/R/S/D]
# Step 2: Data Scientist starts EDA
# → Operation Checkpoint: Approve data processing [Y/N]
# → Output Validation: Review EDA results [A/R/S/D]
# Step 3: Model Engineer trains model
# → Operation Checkpoint: Approve GPU training [Y/N]
# → Output Validation: Review model architecture [A/R/S/D]
```

## 📋 Real-World Project Examples

### E-Commerce Platform Development
```bash
# Inventory Management System
claude "Build inventory tracking system with real-time stock updates"
# → Brainstormer: Multiple architecture approaches
# → System Designer: Event-driven architecture with webhooks
# → Code Architect: Microservice scaffolding
# → Each step validated for quality before proceeding

# Payment Gateway Integration
claude "@system-designer: Design secure payment processing with Stripe and PayPal"
# → Output Validation: Review security considerations
claude "@code-architect: Implement PCI-compliant payment service"
# → Operation Checkpoint: Approve external API integration
# → Output Validation: Verify compliance requirements met
```

### Healthcare Data Platform
```bash
# Patient Records Analysis
claude "@data-scientist: Analyze patient admission patterns for resource planning"
# → Operation Checkpoint: Confirm HIPAA-compliant data handling
# → Output Validation: Review statistical findings and privacy measures

# Predictive Health Monitoring
claude "/project:full-workflow Create early warning system for patient deterioration"
# → Phase 1: Requirements validated for medical accuracy
# → Phase 2: ML model architecture approved by domain expert
# → Phase 3: Implementation reviewed for safety critical standards
# → Phase 4: Monitoring dashboard validated for clinical use
```

### Financial Services API
```bash
# Risk Assessment Engine
claude "@model-engineer: Design credit risk scoring model with explainable AI"
# → Operation Checkpoint: Approve model training resources
# → Output Validation: Review fairness metrics and bias testing

# Trading Platform Backend
claude "/project:tdd-microservice Build order execution service with circuit breakers"
# → TDD Coordinator: Red-Green-Refactor cycles
# → QA Agent: Given-When-Then scenarios for edge cases
# → Each test suite validated before proceeding
```

### SaaS Multi-Tenant Platform
```bash
# Tenant Isolation Architecture
claude "@system-designer: Design multi-tenant database architecture with row-level security"
# → Output Validation: Verify isolation guarantees

# Usage Metering Service
claude "Create usage tracking and billing service for SaaS platform"
# → Brainstormer: Approaches for accurate usage tracking
# → Implementation Planner: Sprint breakdown with milestones
# → Code Architect: Event sourcing implementation
# → All outputs validated for billing accuracy requirements
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

## 🎯 Validation Scenarios in Practice

### Scenario 1: ML Model Development with Dual Validation
```bash
claude "Develop customer churn prediction model"

# Step 1: Data Scientist begins analysis
# → Operation Checkpoint: "Processing 2GB customer data - Approve? [Y/N]"
# User approves → Processing begins
# → Output Validation: "EDA complete. Review findings? [A/R/S/D]"
# User selects 'D' for details, then 'A' to approve

# Step 2: Model Engineer designs architecture  
# → Output Validation: "Model architecture ready. Validate? [A/R/S/D]"
# User selects 'R' and provides feedback: "Add dropout layers"
# Agent revises → Re-validation → User approves

# Step 3: Training begins
# → Operation Checkpoint: "GPU training for 6 hours - Approve? [Y/N]"
# User approves → Training proceeds
```

### Scenario 2: Microservice Development with Quality Gates
```bash
claude "/project:tdd-microservice Create payment processing service"

# TDD Coordinator starts workflow
# → Output Validation: "Test plan ready. Review? [A/R/S/D]"
# → Code Architect generates scaffold
# → Output Validation: "Service structure created. Approve? [A/R/S/D]"
# → QA Agent creates test suites
# → Output Validation: "Test coverage 95%. Proceed? [A/R/S/D]"
```

### Scenario 3: Emergency Production Fix
```bash
claude "Fix critical bug in user authentication causing login failures"

# Routes to @optimization-agent for root cause analysis
# → Output Validation: "Root cause identified. Review fix approach? [A/R/S/D]"
# User selects 'S' (Stop) to handle manually due to criticality
# → Workflow halts for manual intervention
```

### Scenario 4: Compliance-Driven Development
```bash
claude "@requirements-architect: Define GDPR-compliant data retention system"

# Requirements Architect generates specs
# → Output Validation: "Requirements drafted. Legal review needed? [A/R/S/D]"
# User selects 'D' for detailed review
# → Reviews compliance points
# → Selects 'R' with feedback: "Add right-to-erasure workflows"
# → Agent revises with additional compliance measures
# → Re-validation → Approved
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

## ✅ Testing Your Validation System

### Test Operation Checkpoints
```bash
# Test ML operation checkpoint
claude "Train a deep learning model on dataset.csv"
# Expected: Operation checkpoint triggers before training

# Test destructive operation checkpoint  
claude "Delete all temporary files with rm -rf /tmp/*"
# Expected: Checkpoint asks for confirmation

# Test package installation checkpoint
claude "Install scikit-learn and pandas for analysis"
# Expected: Checkpoint for dependency changes
```

### Test Output Validation
```bash
# Test agent output validation
claude "@brainstormer: Design real-time analytics system"
# Expected: After agent completes, validation prompt appears

# Test revision workflow
claude "@system-designer: Create microservices architecture"
# When prompted, select 'R' and provide feedback
# Expected: Agent would revise based on feedback

# Test detailed review
claude "@code-architect: Generate user service"
# When prompted, select 'D' for details
# Expected: Full output displayed for review
```

### Test Combined Workflow
```bash
# Test full workflow with both validation types
claude "/project:full-workflow Build recommendation engine"
# Expected: Multiple checkpoints throughout:
# - Operation checkpoints for resource-intensive tasks
# - Output validation after each agent completes
```

## 🎉 You're Ready!

Your Claude Code Multi-Agent System with dual validation is fully operational:

### What You Can Do:
1. **Automatic routing** - Claude intelligently delegates to specialized agents
2. **Direct agent calls** - Use `@agent:` syntax for specific expertise  
3. **Complete workflows** - Run `/project:full-workflow` for end-to-end development
4. **TDD development** - Use `/project:tdd-microservice` for test-driven APIs

### Validation Layers Active:
- **Pre-execution safety** - Operation checkpoints prevent costly mistakes
- **Post-execution quality** - Output validation ensures deliverable standards
- **Interactive control** - Approve/Revise/Stop/Details at every checkpoint
- **Phase alignment** - Validations map to workflow diagram points (H0-H7)

### Development Process:
The system follows the 4-phase workflow with comprehensive validation:
- **Phase 1**: Initial Scoping (validated requirements & approaches)
- **Phase 2**: System Design (approved architecture & resources)
- **Phase 3**: Execution (quality-assured implementation)
- **Phase 4**: Monitoring (optimized performance)

Every agent output is validated, every expensive operation is confirmed, ensuring both **quality** and **cost control** throughout your development process.