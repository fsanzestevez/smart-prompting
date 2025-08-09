# Execute Complete 4-Phase Development Workflow

Orchestrates the complete Multi-Agent AI Development System workflow through all 4 phases:

## Phase 1: Initial Scoping
- **Requirements Analysis**: @requirements-architect analyzes business needs
- **Solution Exploration**: @brainstormer generates multiple technical approaches  
- **Data Assessment**: @data-scientist performs EDA and feature engineering
- **Human Checkpoints**: H0 (Project Intake) → H0_REQ (Requirements Review) → H0_BRAIN (Solution Validation) → H1 (Final Approval)

## Phase 2: System Design with ML Resource Validation
- **Architecture Design**: @system-designer creates Clean Architecture blueprints
- **Data Strategy**: @data-scientist proposes EDA approach with cost/time estimates
- **H2_DATA (Data Strategy Approval)**: Validate data approach before expensive EDA execution
- **ML Architecture**: @model-engineer designs training pipelines and model architecture
- **H2_MODEL (ML Architecture Approval)**: Confirm model selection and resource requirements
- **ML Planning Coordination**: @implementation-planner coordinates with data science agents for:
  - Training resource allocation and GPU scheduling  
  - Model selection timeline and fallback strategies
  - Data preparation sprints and feature engineering milestones
  - Success metrics definition and evaluation checkpoints
- **H2_PLAN (ML Implementation Plan Approval)**: Validate timeline and resource allocation
- **Human Checkpoints**: H2_DATA → H2_MODEL → H2_PLAN → H3 (Architecture Review) → H4 (Resource Approval)

## Phase 3: Execution
- **Code Generation**: @code-architect generates Clean Architecture scaffolds
- **Model Integration**: @model-engineer integrates trained models into production APIs
- **Dashboard Creation**: @insights-visualizer creates monitoring and reporting interfaces
- **Quality Assurance**: @qa-agent designs comprehensive testing strategy
- **Human Checkpoints**: H5 (Code Review) → H6 (Handoff Decision)

## Phase 4: Hand-off & Monitoring
- **Performance Analysis**: @optimization-agent analyzes system for bottlenecks and improvements
- **Production Monitoring**: @insights-visualizer provides real-time dashboards
- **Human Checkpoints**: H7 (Strategic Alignment)

## Usage
```
/project:full-workflow "Create a customer sentiment analysis system with real-time API and dashboard"
```

This command will guide you through each phase with appropriate agent handoffs and human decision points.