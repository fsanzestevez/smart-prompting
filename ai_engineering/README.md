# AI Agent Prompt Templates & Workflow System

A collection of specialized system prompt templates and workflow documentation for creating AI-powered software development and data science orchestration systems, designed for CRM/CMS automation and machine learning projects.

## Table of Contents

- [Overview](#overview)
- [Contents](#contents)
- [Agent Prompt Templates](#agent-prompt-templates)
- [Workflow Implementation](#workflow-implementation)
- [Usage](#usage)
- [System Architecture](#system-architecture)
- [Phase-Based Development Process](#phase-based-development-process)
- [Customization](#customization)
- [Implementation Guide](#implementation-guide)
- [Contributing](#contributing)

## Overview

This repository contains carefully crafted system prompt templates for **10 specialized AI agents** that work together in a structured **4-phase workflow** to automate the complete software development lifecycle, including machine learning and data science capabilities. The system includes **7 core development agents** and **3 data science agents** that seamlessly integrate to handle both traditional software engineering and ML/AI projects.

**Target Use Cases**: 
- CRM/CMS automation projects requiring Clean Architecture principles
- Machine learning model development and deployment
- Data analytics and visualization dashboards
- End-to-end AI/ML pipeline automation with human oversight

## Contents

### Native Claude Code Subagent Implementation

#### Active Subagent System
```
.claude/
├── agents/                           # Native Claude Code subagents
│   ├── brainstormer.md              # Creative solution exploration
│   ├── requirements-architect.md    # Business-to-technical translation
│   ├── system-designer.md           # Clean Architecture design  
│   ├── implementation-planner.md    # Sprint strategy and resource planning
│   ├── code-architect.md            # TDD-first Clean Architecture scaffold generation
│   ├── qa-agent.md                  # FastAPI testing with Given-When-Then structure
│   ├── tdd-coordinator.md           # TDD workflow orchestration specialist
│   ├── optimization-agent.md        # Performance and improvement analysis
│   ├── data-scientist.md            # EDA and feature engineering
│   ├── model-engineer.md            # ML model architecture and training
│   └── insights-visualizer.md       # Dashboard and visualization
└── commands/
    ├── full-workflow.md              # Complete 4-phase workflow orchestration
    └── tdd-microservice.md           # TDD-focused FastAPI microservice development
```

#### Reference Materials
```
reference_materials/
├── agent_specifications/             # Original agent prompt templates
│   ├── 1-Brainstormer.md            # Source specification for brainstormer
│   ├── 2-requirements_architect.md  # Source specification for requirements
│   ├── 3-SystemDesigner.md          # Source specification for system design
│   ├── 4-ImplementationPlanner.md   # Source specification for planning
│   ├── 5-CodeArchitect.md           # Source specification for code generation
│   ├── 6-QAAgent.md                 # Source specification for QA
│   ├── 7-OptimisationAgent.md       # Source specification for optimization
│   ├── DS-1-DataScientist.md        # Source specification for data science
│   ├── DS-2-ModelEngineer.md        # Source specification for ML engineering  
│   ├── DS-3-InsightsVisualizer.md   # Source specification for visualization
│   └── agent_meta_prompt.md         # Template for creating new agents
├── workflow_diagrams/                # Visual workflow representations
│   ├── workflow.mermaid             # Core 4-phase workflow diagram
│   ├── workflow-with-ds.mermaid     # Extended workflow with DS integration
│   └── workflow.svg                 # Visual workflow representation
└── claude_code_agent_generation_thread.md  # Implementation methodology
```

### Supporting Documentation
- **4-phase workflow diagram**: Visual representation of agent interactions across development phases
- **Iterative scoping process**: Initial requirements-brainstorming refinement cycle
- **Human checkpoint definitions**: Guidelines for strategic decision points
- **Clean Architecture principles**: Embedded architectural standards

## Agent Prompt Templates

Each prompt template is designed for specific AI model integration (optimized for Gemini 2.5 Pro) and includes:

### Core Development Agents

| Template | Purpose | Phase | Key Features |
|----------|---------|-------|--------------|
| **Brainstorming Agent** | Solution exploration & technology evaluation | Phase 1 | Multi-approach analysis, feasibility assessment, creative problem-solving |
| **Requirements Architect** | Business requirements to technical specifications | Phase 1 | Risk assessment, success criteria definition, stakeholder communication |
| **System Design Agent** | Clean Architecture blueprint creation | Phase 2 | SOLID principles, API contracts, scalability patterns |
| **Implementation Planner** | Sprint strategy & resource allocation | Phase 2 | Timeline optimization, team coordination, dependency management |
| **Code Architect Agent** | TDD-first Clean Architecture scaffold generation | Phase 3 | Service skeletons, SOLID implementation, Red-Green-Refactor cycles |
| **QA Agent** | FastAPI testing with Given-When-Then structure | Phase 3 | Test suite generation, architectural compliance, mock-first strategy |
| **TDD Coordinator** | TDD workflow orchestration for FastAPI services | Phase 3 | Red-Green-Refactor enforcement, human checkpoint integration, pytest coordination |
| **Optimization Analyst** | Performance analysis & improvements | Phase 4 | Production metrics review, technical debt assessment |

### Data Science Agents

| Template | Purpose | Phase | Key Features |
|----------|---------|-------|--------------|
| **Data Scientist** | EDA & feature engineering | Phase 1-2 | Statistical profiling, pattern discovery, feature transformation, data quality assessment |
| **Model Engineer** | ML architecture & training | Phase 2-3 | Algorithm selection, hyperparameter optimization, model versioning, performance evaluation |
| **Insights Visualizer** | Dashboards & monitoring | Phase 3-4 | Interactive visualizations, KPI dashboards, model monitoring, stakeholder reporting |

### Template Structure

Each prompt template contains:
- **Role definition** with specific expertise areas
- **Input/output specifications** for agent communication
- **Tool integration guidelines** (code generation, web search, analysis)
- **Reasoning patterns** (Chain-of-Thought, Tree-of-Thought)
- **Quality validation criteria**
- **Human checkpoint preparation** instructions

## Workflow Implementation

The templates implement a **4-phase structured workflow** with **8 human checkpoints** for strategic oversight, including an **iterative initial scoping process**:

## System Architecture

The framework processes projects through a sophisticated 4-phase pipeline with iterative requirements refinement and strategic human oversight:

![Workflow Diagram](workflow.svg)

## Phase-Based Development Process

### **Phase 1: Initial Scoping** 
*Iterative Requirements & Solution Discovery*

**Objective**: Achieve alignment on project requirements and technical approach through iterative refinement.

**Key Features**:
- **Iterative Requirements Cycle**: Human → Requirements Architect → Human validation with refinement loops
- **Data Exploration**: Data Scientist Agent performs EDA and feature engineering to inform solution approaches
- **Solution Exploration Cycle**: Requirements → Brainstorming Agent → Human validation with solution refinement
- **Flexible Navigation**: Human oversight can route between requirements and brainstorming based on project needs
- **Quality Gates**: Multiple validation checkpoints before committing to final approach

**Participants**: H0 (Project Intake), H0_REQ (Requirements Review), H0_BRAIN (Solution Validation), Requirements Architect Agent, Brainstorming Agent, Data Scientist Agent (for ML projects)

### **Phase 2: System Design**
*Architecture & Implementation Planning*

**Objective**: Transform validated requirements and approach into detailed system architecture and development strategy.

**Key Features**:
- **Clean Architecture Blueprint**: System Design Agent creates SOLID-compliant architectures
- **ML Pipeline Design**: Model Engineer Agent designs training pipelines and model architectures (for ML projects)
- **Implementation Strategy**: Implementation Planner decomposes design into executable development tasks
- **Resource Allocation**: Strategic planning for team assignments and timeline optimization
- **Architecture Validation**: Human oversight ensures technical feasibility and business alignment

**Participants**: H1 (Requirements & Approach Validated), System Design Agent, Implementation Planner Agent, Model Engineer Agent (for ML projects), H3 (Architecture Review), H4 (Resource Approval)

### **Phase 3: Execution**
*Code Generation & Quality Assurance*

**Objective**: Generate production-ready code scaffolds with comprehensive testing strategy.

**Key Features**:
- **TDD-First Development**: TDD Coordinator orchestrates Red-Green-Refactor cycles with Given-When-Then testing
- **Clean Architecture Scaffolding**: Code Architect Agent generates service skeletons with TDD discipline
- **Model Integration**: Code Architect integrates trained ML models into production APIs (for ML projects)
- **FastAPI Testing**: QA Agent designs comprehensive pytest suites with mock-first strategy
- **Dashboard Development**: Insights Visualizer Agent creates monitoring and reporting interfaces
- **Quality Gates**: Human code review ensures TDD compliance and architectural standards
- **Deployment Readiness**: Preparation for external DevOps handoff

**Participants**: TDD Coordinator Agent, Code Architect Agent, QA Agent, Insights Visualizer Agent (for dashboards), H5 (Code Review), H6 (Handoff Decision)

### **Phase 4: Hand-off & Monitoring**
*Production Optimization & Strategic Oversight*

**Objective**: Continuous performance optimization and strategic process improvement.

**Key Features**:
- **Performance Analysis**: Optimization Analyst reviews production metrics and user feedback
- **Model Monitoring**: Insights Visualizer provides real-time model performance dashboards (for ML projects)
- **Drift Detection**: Model Engineer Agent monitors for data drift and model degradation
- **Improvement Recommendations**: Technical debt assessment and optimization suggestions
- **Strategic Alignment**: Human oversight for organizational goal alignment and process improvements
- **Feedback Integration**: Insights fed back to earlier phases for continuous improvement

**Participants**: Optimization Analyst Agent, Insights Visualizer Agent (for monitoring), H7 (Strategic Alignment), External DevOps Team

### **Cross-Phase Integration**

- **Context Sharing**: Parallel processing connections preserve knowledge across phases
- **Data Pipeline**: Data flows from Data Scientist → Model Engineer → Code Architect for ML projects
- **Visualization Pipeline**: Insights flow from all agents to Insights Visualizer for dashboard creation
- **Feedback Loops**: Strategic insights from Phase 4 inform future Phase 1 iterations
- **Quality Continuity**: Architectural decisions propagate from design through execution
- **Human Oversight**: Strategic checkpoints at every critical transition point

## Usage

### Quick Setup for New Projects

1. **Copy the Claude Code subagent system**:
```bash
# Copy the native subagent system to your project
cp -r .claude/ your-new-project/
cd your-new-project
```

2. **Start using immediately**:
```bash
# Automatic agent delegation
claude "Build a customer sentiment analysis API"

# Explicit agent invocation  
claude "@brainstormer: Generate 3 solution approaches for real-time data processing"

# Complete 4-phase workflow
claude "/project:full-workflow Create a recommendation engine with ML pipeline"

# TDD-focused FastAPI microservice development
claude "/project:tdd-microservice Create a user management service with CRUD operations"
```

3. **Customize agents** (optional):
```bash
# Edit individual agent configurations
nano .claude/agents/brainstormer.md
nano .claude/agents/system-designer.md

# Create new agents based on existing templates
cp .claude/agents/brainstormer.md .claude/agents/custom-agent.md
```

### Native Claude Code Integration

The system uses **native Claude Code subagents** with:
- **Automatic task delegation** based on context analysis
- **YAML frontmatter configuration** for proper agent specification
- **Individual agent access** via `@agent-name:` syntax
- **Slash commands** for workflow orchestration via `/project:command`
- **Independent context windows** for each specialized agent

### Running Projects Through the 4-Phase Workflow

**Option 1: Complete Workflow Command**
```bash
claude "/project:full-workflow [your project description]"
# Orchestrates all phases with human checkpoints

claude "/project:tdd-microservice [your FastAPI service description]"
# TDD-focused FastAPI microservice development with Clean Architecture
```

**Option 2: Manual Phase Progression**
```bash
# Phase 1: Initial Scoping
claude "@requirements-architect: Analyze these business requirements..."
claude "@brainstormer: Generate solution approaches based on requirements..."
claude "@data-scientist: Perform EDA on this dataset..." # For ML projects

# Phase 2: System Design  
claude "@system-designer: Create Clean Architecture blueprint..."
claude "@model-engineer: Design ML training pipeline..." # For ML projects
claude "@implementation-planner: Create sprint strategy..."

# Phase 3: Execution
claude "@tdd-coordinator: Orchestrate TDD-first development workflow..."
claude "@code-architect: Generate Clean Architecture scaffolds with TDD..."
claude "@insights-visualizer: Create monitoring dashboards..."
claude "@qa-agent: Design FastAPI testing strategy with Given-When-Then..."

# Phase 4: Optimization
claude "@optimization-agent: Analyze system for improvements..."
```

## Agent Communication Protocol

The templates implement structured agent communication:
- **Phase-aware handoffs** with clear stage transitions
- **Context preservation** across phase boundaries
- **Quality validation** before human checkpoint presentations
- **Decision support materials** for strategic reviews

## Human-in-the-Loop Integration

Each template includes instructions for:
- **Phase-specific decision points** aligned with development workflow
- **Iterative validation cycles** within Phase 1 for requirements refinement
- **Executive summary generation** for strategic checkpoint reviews
- **Cross-phase feedback integration** for continuous improvement

## Clean Architecture Emphasis

All templates embed Clean Architecture principles with TDD-first approach:
- **TDD-Driven Development**: Red-Green-Refactor cycles ensure clean, testable code
- **SOLID compliance** throughout all phases
- **Domain-driven design** patterns in system architecture  
- **Dependency inversion** for testability and maintainability
- **Hexagonal architecture** with ports and adapters
- **Given-When-Then testing** structure for FastAPI microservices
- **Mock-first strategy** for external dependency isolation

## Customization

### Adapting Templates for Different Domains

1. **Technology Stack Modification**:
   - Update tool references in prompt templates
   - Modify architectural patterns for your stack
   - Adjust phase-specific validation criteria

2. **Industry-Specific Customization**:
   - Add domain expertise to agent roles
   - Include industry compliance requirements in relevant phases
   - Modify quality gates for specific standards

3. **Organization Integration**:
   - Align human checkpoints with approval processes
   - Integrate with existing development workflows
   - Customize phase transition criteria

### Template Modification Guidelines

- **Preserve phase structure** while adding domain specifics
- **Maintain iterative Phase 1 cycles** for requirements refinement
- **Keep cross-phase context sharing** intact
- **Test complete workflow coherence** after modifications

## Implementation Guide

### Step 1: AI Platform Integration

Choose and configure your AI platform:
- **Gemini 2.5 Pro** (recommended, templates optimized)
- **GPT-4** (requires minor prompt adaptations)
- **Claude** (requires communication protocol adjustments)

### Step 2: Phase-Based Workflow Orchestration

Implement the 4-phase agent workflow:
- Set up iterative loops within Phase 1
- Create phase transition mechanisms
- Configure cross-phase context storage and retrieval
- Implement strategic feedback loop mechanisms

### Step 3: Human Interface Design

Create interfaces for phase-specific human checkpoints:
- **Phase 1**: Iterative requirement and solution validation dashboards
- **Phase 2**: Architecture review and resource approval interfaces
- **Phase 3**: Code review and deployment readiness workflows
- **Phase 4**: Strategic alignment and continuous improvement dashboards

### Step 4: Integration Testing

Validate the complete system:
- **End-to-end phase workflow** execution
- **Iterative Phase 1 cycles** functionality
- **Cross-phase context preservation** verification
- **Strategic feedback loops** validation

## Development Workflow

### Creating Custom Agents

Use the existing templates as patterns:
1. Define agent specialization and target phase
2. Specify input/output contracts within phase context
3. Include phase-appropriate tool integration requirements
4. Add human checkpoint preparation instructions
5. Test integration with phase-based workflow

### Extending the Workflow

To add new phases or modify existing ones:
1. Analyze phase insertion points in the workflow
2. Update the mermaid diagram with new phase subgraphs
3. Create new prompt templates for phase-specific agents
4. Define new human checkpoints if needed
5. Update cross-phase context-sharing protocols

## Contributing

### Template Improvement

- **Phase-specific enhancements** to agent roles
- **Iterative process optimization** for Phase 1 refinement cycles
- **Cross-phase integration** improvements
- **Human checkpoint** usability enhancements

### Documentation Updates

- **Phase-based implementation** examples for different platforms
- **Iterative workflow customization** guides for specific industries
- **Best practices** documentation for phase transitions
- **Troubleshooting guides** for complex workflow scenarios

### Quality Standards

- Test all template modifications across complete phase workflow
- Maintain iterative Phase 1 functionality
- Follow Clean Architecture principles in recommendations
- Document phase-specific changes with clear rationale

## Support & Community

- **Implementation Questions**: Create issues for phase-based setup guidance
- **Template Improvements**: Submit pull requests with phase-aware enhancements
- **Workflow Modifications**: Share custom phase adaptations
- **Integration Examples**: Contribute platform-specific phase implementations

**Designed for AI engineers building sophisticated, phase-based, human-supervised development and data science automation systems with iterative requirements refinement, Clean Architecture principles, and end-to-end ML pipeline support.**
