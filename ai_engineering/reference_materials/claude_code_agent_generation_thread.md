# Claude Code Agent Generation Instructions

## INSTRUCTIONS FOR CLAUDE CODE

This message thread contains a complete conversation about designing specialized agents for Python LLM microservices development. Use this as your guideline to generate similar agent configurations.

### How to Interpret This Thread:
1. **Context**: The human wanted to optimize Claude Code as a coding partner for Python applications that integrate with LLMs
2. **Outcome**: A 5-agent system with specialized roles for TDD workflows
3. **Your Task**: Generate similar agent configurations following the patterns shown
4. **Key Artifacts**: Reference these downloadable files for complete implementation:
   - `<main_claude_config.md>` - Global Claude Code configuration
   - `<requirements_analyst_config.md>` - Requirements Analyst agent configuration
   - `<test_designer_config.md>` - Test Designer agent configuration
   - `<global_claude_config.md>` - Global system-level configuration
   - `<project_override_config.md>` - Project-specific override example

### Agent Design Patterns to Follow:
- Each agent has specific expertise and responsibilities
- Agents use structured prompt templates with clear output formats
- Communication between agents follows defined handoff protocols
- TDD workflow is enforced through agent specialization
- LLM-specific patterns (mocking, semantic evaluation, error handling) are built-in

### Generate Similar Agents For:
- Other programming languages (JavaScript, Go, Rust, etc.)
- Different architectural patterns (Event-driven, Microservices, Monolith)
- Various testing strategies (BDD, Property-based testing, etc.)
- Different domains (Web apps, Data pipelines, ML systems, etc.)

---

# ORIGINAL MESSAGE THREAD

## Human Message 1:
Help me improve my prompt for a Deep research task:
```
How can I make Claude code the best coding partner? 
I suppose I have to create sub-agents, but how and which ones? Can I tell the main Claude Code to build sub-agents to divide the tasks he needs to do and create "experts" in different domains (planner, coder, tester etc)
```

## Assistant Message 1:
Your prompt has a great foundation, but it could be more specific and actionable. Here's how to improve it:

**Current issues:**
- Too broad and exploratory
- Lacks specific context about your coding workflow
- Unclear what "best coding partner" means for your use case

**Improved version:**

```
I want to optimize Claude Code as my coding partner for [specific type of projects, e.g., "full-stack web applications" or "data analysis pipelines"]. 

Current workflow challenges:
- [List 2-3 specific pain points, e.g., "I spend too much time on boilerplate code" or "Testing coverage is inconsistent"]

Goals:
- [Specific outcomes you want, e.g., "Reduce setup time by 50%" or "Ensure comprehensive test coverage"]

Questions:
1. Should I create specialized sub-agents (planner, architect, coder, tester, reviewer) within Claude Code, and if so, how?
2. What's the optimal way to structure agent responsibilities to avoid overlap and ensure quality?
3. Can you provide a concrete implementation plan with example prompts for each specialized agent?
4. How should these agents communicate and hand off work between each other?

Please provide actionable steps I can implement immediately, including specific prompt templates for each suggested agent role.
```

**Key improvements:**
- **Specificity**: Define your project type and current challenges
- **Measurable goals**: Clear success criteria
- **Structured questions**: Focused sub-questions instead of one broad ask
- **Actionable request**: Asks for concrete implementation steps
- **Context**: Provides background for more targeted advice

This approach will get you much more useful, specific guidance from Claude Code about building an effective multi-agent workflow.

## Human Message 2:
I want to optimize Claude Code as my coding partner for [python code that does different tasks calling LLMs]. 

Current workflow challenges:
1- I spent a lot of time designing the boilerplate, following TDD and Clean-Architecture framework
2- I spent way too much time doing unit tests (using pytest)
3- I spent time designing the best workflows

Goals:
- handle all possible edge cases
- defining requirements
- defining user stories
- starting developing from unit tests and e2e tests before coding

Questions:
1. Should I create specialized sub-agents (planner, architect, coder, tester, reviewer) within Claude Code, and if so, how?
2. What's the optimal way to structure agent responsibilities to avoid overlap and ensure quality?
3. Can you provide a concrete implementation plan with example prompts for each specialized agent?
4. How should these agents communicate and hand off work between each other?

Please provide actionable steps I can implement immediately, including specific prompt templates for each suggested agent role.

## Assistant Message 2:

Let me ask a few clarifying questions to help design the most effective Claude Code agent system for your Python LLM workflow:

1. **LLM Integration Complexity**: Are you building applications that orchestrate multiple LLM calls (like agent workflows, RAG systems, or multi-step reasoning chains), or simpler single-purpose LLM utilities?

2. **Testing Scope**: When you mention spending too much time on unit tests, are you primarily struggling with mocking LLM API calls, testing non-deterministic outputs, or the volume of edge cases around API failures/rate limits?

3. **Project Scale**: Are these typically standalone scripts/tools, or larger applications with databases, APIs, and multiple modules that need integration testing?

These details will help me design agent roles and responsibilities that directly address your Python LLM development pain points, rather than generic coding workflows.

## Human Message 3:
1. Both, depending on the risk, sometimes I'm limited to one single prompt so the risk department accepts the solution. Sometimes bc they're internal tools, I can make more complex projects

2. Everything. I'm very bad at unit testing

3. they are mid size. They're usually micro-services, sometimes they have to handle crud operations, but most often are pure micro-services that receive already everything needed in the request input

## Assistant Message 3:

Perfect context! I'll do some comprehensive research to design an optimal Claude Code agent system for your Python LLM microservices development workflow.

[Extended research was performed here - see full implementation details in the referenced artifacts]

Your specialized Claude Code Agent system for Python LLM microservices is ready. The report details a five-agent architecture (Requirements Analyst, Test Designer, Code Architect, Integration Tester, and Quality Reviewer) implementing Test-Driven Development for LLM microservices. It includes complete implementation templates, agent communication patterns, deployment strategies across 4 weeks, and performance metrics. The system provides structured workflow orchestration with continuous improvement capabilities.

## Key Agent Architecture Summary:

### 1. Requirements Analyst Agent
**Role**: Transform business needs into technical specifications
**Key Responsibilities**:
- Decompose business requirements into user stories
- Define acceptance criteria with measurable outcomes  
- Identify edge cases and failure scenarios
- Generate domain models and value objects

### 2. Test Designer Agent  
**Role**: Create comprehensive test suites before any code is written
**Key Responsibilities**:
- Generate unit tests with mocked LLM responses
- Design integration tests for service interactions
- Create property-based tests for non-deterministic outputs
- Implement semantic evaluation metrics

### 3. Code Architect Agent
**Role**: Implement Clean Architecture patterns and generate production-ready code
**Key Responsibilities**:
- Implement domain entities and use cases
- Create infrastructure adapters for LLM APIs
- Design repository patterns for prompt management
- Implement resilience patterns (circuit breakers, retries)

### 4. Integration Tester Agent
**Role**: Validate system behavior across service boundaries
**Key Responsibilities**:
- Execute comprehensive integration tests
- Validate multi-service interactions
- Test conversation flows and state management
- Perform load and reliability testing

### 5. Quality Reviewer Agent
**Role**: Ensure code quality, security, and adherence to best practices
**Key Responsibilities**:
- Review code for Clean Architecture compliance
- Identify security vulnerabilities
- Suggest performance optimizations
- Ensure comprehensive error handling

## Agent Communication Pattern:
The system employs a supervisor-based orchestration pattern optimized for TDD workflows, where agents communicate through structured Command objects that preserve context and enable traceable workflows.

## Human Message 4:
now that you know, how should I organise claude code? How do I set the md files? and where

## Assistant Message 4:

Based on the comprehensive agent system I designed for you, here's exactly how to organize Claude Code for your Python LLM microservices workflow:

## Project Structure & Organization

### 1. Root Directory Setup
```
your-project/
├── CLAUDE.md                    # Main Claude Code configuration
├── agents/                      # Agent-specific configurations
│   ├── requirements-analyst.md
│   ├── test-designer.md
│   ├── code-architect.md
│   ├── integration-tester.md
│   └── quality-reviewer.md
├── workflows/                   # Workflow templates
│   ├── tdd-workflow.md
│   └── microservice-patterns.md
├── src/                        # Your actual code
├── tests/                      # Test files
└── docs/                       # Documentation
```

### 2. Main CLAUDE.md Configuration
[See `<main_claude_config.md>` for complete implementation]

### 3. Agent-Specific Configuration Files
[See `<requirements_analyst_config.md>` and `<test_designer_config.md>` for detailed examples]

### 4. Quick Start Commands
[See workflow files for complete TDD command templates]

## 5. How to Set Up in Claude Code

### Step 1: Initialize Your Project
```bash
# In your terminal, navigate to your project directory
cd your-llm-microservice-project

# Initialize Claude Code (if not already done)
claude init
```

### Step 2: Create the Configuration Files
1. **Copy the CLAUDE.md content** to your project root
2. **Create the `agents/` directory** and add the agent-specific `.md` files
3. **Create the `workflows/` directory** with the workflow templates

### Step 3: Test the Setup
```bash
# Test that Claude Code recognizes your configuration
claude status

# Try a simple command to verify agent switching works
claude "Act as @requirements-analyst and analyze this requirement: Create a simple text summarization API"
```

### Step 4: Usage Examples

#### For a new feature:
```bash
claude "I need to implement a sentiment analysis endpoint. Please follow our TDD workflow starting with @requirements-analyst."
```

#### For debugging:
```bash
claude "@integration-tester: These tests are failing: [paste test output]. Please diagnose and suggest fixes."
```

#### For code review:
```bash
claude "@quality-reviewer: Review this implementation for security and performance issues: [paste code]"
```

## Key Benefits of This Organization

1. **Clear Agent Separation**: Each agent has specific responsibilities and prompt templates
2. **Consistent TDD Flow**: The workflow ensures you always follow Red-Green-Refactor
3. **LLM-Specific Patterns**: Built-in handling for common LLM integration challenges
4. **Quality Gates**: Automated checks at each stage prevent technical debt
5. **Scalable Structure**: Easy to add new agents or modify existing ones

The setup ensures that Claude Code understands your Python LLM microservice context and can switch between specialized roles seamlessly, dramatically reducing your boilerplate time and ensuring comprehensive test coverage from the start.

## Human Message 5:
but why do I have to set that up in every single project I do? Isn't there a way to do at system level?

## Assistant Message 5:

You're absolutely right! Setting this up for every project would be incredibly tedious. Claude Code supports **global configuration** that applies across all your projects.

## Global Configuration Setup

### 1. Global CLAUDE.md Location
Create a global configuration file in your home directory:

```bash
# On macOS/Linux
~/.claude/CLAUDE.md

# On Windows  
%USERPROFILE%\.claude\CLAUDE.md
```

### 2. Global Agent Library
Create a reusable agent library:

```bash
~/.claude/
├── CLAUDE.md                    # Global defaults
├── agents/                      # Reusable agent templates
│   ├── python-requirements-analyst.md
│   ├── python-test-designer.md
│   ├── python-code-architect.md
│   ├── python-integration-tester.md
│   └── python-quality-reviewer.md
├── workflows/                   # Reusable workflows
│   ├── python-tdd-workflow.md
│   ├── llm-microservice-patterns.md
│   └── clean-architecture-patterns.md
└── templates/                   # Project templates
    ├── python-microservice/
    └── llm-integration/
```

### 3. Global CLAUDE.md Configuration
[See `<global_claude_config.md>` for complete global configuration]

### 4. Project-Specific Overrides
[See `<project_override_config.md>` for inheritance example]

## How This Works in Practice

### 1. One-Time Global Setup
```bash
# Create global directory
mkdir -p ~/.claude/agents ~/.claude/workflows ~/.claude/templates

# Copy global configuration files (one time only)
cp global-claude-config.md ~/.claude/CLAUDE.md
cp agents/*.md ~/.claude/agents/
cp workflows/*.md ~/.claude/workflows/
```

### 2. Per-Project Usage

**Option A: Use Global Defaults (No local CLAUDE.md needed)**
```bash
cd new-project/
claude "Initialize Python LLM microservice following my global standards"
# Claude automatically uses ~/.claude/CLAUDE.md
```

**Option B: Project-Specific Customization**
```bash
cd customer-support-project/
# Create minimal project override
echo "# Inherits ~/.claude/CLAUDE.md + customer support specific requirements" > CLAUDE.md
claude "Implement customer query classification with PII handling"
```

### 3. Benefits of This Approach

**Consistency Across Projects**
- Same high-quality patterns everywhere
- No need to re-explain your preferences
- Agents remember your coding style

**Flexibility When Needed**
- Project overrides for special requirements
- Domain-specific agent additions
- Custom workflows for unique contexts

**Maintenance Efficiency**
- Update global config once, applies everywhere
- Evolve your standards over time
- Share configurations across teams

### 4. Advanced: Team Configuration

You can even share configurations across your team:

```bash
# Team shared configuration
git clone git@company.com:engineering/claude-config.git ~/.claude
cd ~/.claude && git pull  # Keep team standards updated
```

This way, you set up your Python LLM microservice expertise **once** globally, and every new project automatically gets your proven patterns, agents, and workflows without any additional setup!

## Human Message 6:
Give me the whole message thread in a markdown artifact. I will send it to claude code itself so it can generate agents itself. explicitly say which message is the assistant message, which is the human message. I can download the artifacts myself, you'll just have to reference them with a <filename.md> so claude code knows what to read. 

Give also instructions for claude code to know how to interpret the whole message thread. These instructions have to be at the very top. 

I already have the different agents I want predefined, so the message thread will serve as pure guidelines with examples of how to generate subagents for Claude Code

---

# END OF MESSAGE THREAD

## Summary for Claude Code Agent Generation:

This conversation demonstrates a systematic approach to creating specialized coding agents:

1. **Start with specific context** (Python LLM microservices)
2. **Identify workflow pain points** (boilerplate, testing, architecture)
3. **Design specialized agents** with clear responsibilities
4. **Create structured templates** for consistency
5. **Implement global configuration** for reusability
6. **Provide concrete examples** and implementation details

Use this pattern to generate similar agent systems for your specific use cases, adapting the roles, responsibilities, and templates to match your domain expertise and workflow requirements.