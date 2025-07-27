# AI Agent Prompt Templates & Workflow System

A collection of specialized system prompt templates and workflow documentation for creating AI-powered software development orchestration systems, specifically designed for CRM/CMS automation projects.

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

This repository contains carefully crafted system prompt templates for **7 specialized AI agents** that work together in a structured **4-phase workflow** to automate the complete software development lifecycle. Each template is designed to create agents with specific expertise areas, from initial brainstorming to production optimization, while maintaining human oversight at critical decision points.

**Target Use Case**: CRM/CMS automation projects requiring Clean Architecture principles and structured development processes with iterative requirements refinement.

## Contents

### Prompt Template Files
```
├── 1-Brainstormer.md           # Creative solution exploration agent
├── 2-requirements_architect.md        # Business-to-technical translation agent  
├── 3-SystemDesigner.md        # Clean Architecture design agent
├── 4-ImplementationPlanner.md       # Sprint strategy and resource planning agent
├── 5-CodeArchitect.md        # Clean Architecture scaffold generation agent
├── 6-QAAgent.md                    # Quality assurance and testing agent
├── 7-OptimisationAgent.md         # Performance and improvement analysis agent
├── agent_meta_prompt.md         # Meta Prompt to build agent's system prompt
├── workflow.svg                    # Visual representation of workflow
└── workflow.mermaid            # Mermaid flowchart of complete process
```

### Supporting Documentation
- **4-phase workflow diagram**: Visual representation of agent interactions across development phases
- **Iterative scoping process**: Initial requirements-brainstorming refinement cycle
- **Human checkpoint definitions**: Guidelines for strategic decision points
- **Clean Architecture principles**: Embedded architectural standards

## Agent Prompt Templates

Each prompt template is designed for specific AI model integration (optimized for Gemini 2.5 Pro) and includes:

| Template | Purpose | Phase | Key Features |
|----------|---------|-------|--------------|
| **Brainstorming Agent** | Solution exploration & technology evaluation | Phase 1 | Multi-approach analysis, feasibility assessment, creative problem-solving |
| **Requirements Architect** | Business requirements to technical specifications | Phase 1 | Risk assessment, success criteria definition, stakeholder communication |
| **System Design Agent** | Clean Architecture blueprint creation | Phase 2 | SOLID principles, API contracts, scalability patterns |
| **Implementation Planner** | Sprint strategy & resource allocation | Phase 2 | Timeline optimization, team coordination, dependency management |
| **Code Architect Agent** | Clean Architecture scaffold generation | Phase 3 | Service skeletons, SOLID implementation, test harness creation |
| **QA Agent** | Automated testing & validation | Phase 3 | Test suite generation, architectural compliance, quality gates |
| **Optimization Analyst** | Performance analysis & improvements | Phase 4 | Production metrics review, technical debt assessment |

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
- **Solution Exploration Cycle**: Requirements → Brainstorming Agent → Human validation with solution refinement
- **Flexible Navigation**: Human oversight can route between requirements and brainstorming based on project needs
- **Quality Gates**: Multiple validation checkpoints before committing to final approach

**Participants**: H0 (Project Intake), H0_REQ (Requirements Review), H0_BRAIN (Solution Validation), Requirements Architect Agent, Brainstorming Agent

### **Phase 2: System Design**
*Architecture & Implementation Planning*

**Objective**: Transform validated requirements and approach into detailed system architecture and development strategy.

**Key Features**:
- **Clean Architecture Blueprint**: System Design Agent creates SOLID-compliant architectures
- **Implementation Strategy**: Implementation Planner decomposes design into executable development tasks
- **Resource Allocation**: Strategic planning for team assignments and timeline optimization
- **Architecture Validation**: Human oversight ensures technical feasibility and business alignment

**Participants**: H1 (Requirements & Approach Validated), System Design Agent, Implementation Planner Agent, H3 (Architecture Review), H4 (Resource Approval)

### **Phase 3: Execution**
*Code Generation & Quality Assurance*

**Objective**: Generate production-ready code scaffolds with comprehensive testing strategy.

**Key Features**:
- **Clean Architecture Scaffolding**: Code Architect Agent generates service skeletons and business logic
- **Automated Testing Strategy**: QA Agent designs comprehensive test suites and validation frameworks
- **Quality Gates**: Human code review ensures architectural compliance and quality standards
- **Deployment Readiness**: Preparation for external DevOps handoff

**Participants**: Code Architect Agent, QA Agent, H5 (Code Review), H6 (Handoff Decision)

### **Phase 4: Hand-off & Monitoring**
*Production Optimization & Strategic Oversight*

**Objective**: Continuous performance optimization and strategic process improvement.

**Key Features**:
- **Performance Analysis**: Optimization Analyst reviews production metrics and user feedback
- **Improvement Recommendations**: Technical debt assessment and optimization suggestions
- **Strategic Alignment**: Human oversight for organizational goal alignment and process improvements
- **Feedback Integration**: Insights fed back to earlier phases for continuous improvement

**Participants**: Optimization Analyst Agent, H7 (Strategic Alignment), External DevOps Team

### **Cross-Phase Integration**

- **Context Sharing**: Parallel processing connections preserve knowledge across phases
- **Feedback Loops**: Strategic insights from Phase 4 inform future Phase 1 iterations
- **Quality Continuity**: Architectural decisions propagate from design through execution
- **Human Oversight**: Strategic checkpoints at every critical transition point

## Usage

### Setting Up Your AI Orchestration System

1. **Choose your AI platform** (templates optimized for Gemini 2.5 Pro, adaptable to others)

2. **Deploy agent instances** using the provided prompt templates:
```bash
# Example: Configure Requirements Architect Agent for Phase 1
cp requirements-architect.md your-ai-platform/agents/requirements-prompt.txt
```

3. **Configure phase-based workflow orchestration**:
   - Set up iterative loops within Phase 1 (Initial Scoping)
   - Implement human checkpoint integration at phase transitions
   - Configure context sharing between agents across phases

4. **Customize for your domain**:
   - Modify templates for specific technology stacks
   - Adjust phase transition criteria
   - Integrate with existing development tools

### Running a Project Through the 4-Phase Workflow

1. **Phase 1 Entry**: Human provides project requirements (H0)
2. **Iterative Scoping**: Requirements and brainstorming agents refine specifications with human validation
3. **Phase Transitions**: Strategic human decisions at each phase boundary (H1, H4, H6)
4. **Cross-Phase Context**: Agents share relevant knowledge for downstream processing
5. **Continuous Feedback**: Phase 4 insights improve future Phase 1 iterations

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

All templates embed Clean Architecture principles:
- **SOLID compliance** throughout all phases
- **Domain-driven design** patterns in system architecture
- **Dependency inversion** for testability and maintainability
- **Hexagonal architecture** with ports and adapters

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

**Designed for AI engineers building sophisticated, phase-based, human-supervised development automation systems with iterative requirements refinement and Clean Architecture principles.**
