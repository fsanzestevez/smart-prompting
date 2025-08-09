# Global Claude Code Configuration

## Default Development Standards

### My Preferred Tech Stack
- **Language**: Python 3.12+
- **Architecture**: Clean Architecture with Domain-Driven Design
- **Web Framework**: FastAPI with async/await
- **Testing**: Test-Driven Development (TDD) with pytest
- **Dependency Injection**: Dishka
- **Database**: PostgreSQL with async SQLAlchemy
- **Cache**: Redis
- **Containerization**: Docker with multi-stage builds

### My LLM Integration Expertise
- **Primary Models**: OpenAI GPT-4, Anthropic Claude
- **Patterns**: Circuit breakers, retry logic, semantic evaluation
- **Testing**: Mock all LLM calls in unit tests, use deepeval for integration
- **Cost Management**: Token counting, model fallbacks, response caching

## Global Agent Roles

When I don't specify a project-specific agent, use these defaults:

### @requirements-analyst
- **Specialty**: Python microservices with LLM integration
- **Output**: Structured JSON with user stories, domain models, API specs
- **Focus**: Edge cases for LLM failures, rate limiting, cost optimization

### @test-designer  
- **Framework**: pytest with 90% coverage minimum
- **LLM Testing**: respx for HTTP mocking, deepeval for semantic evaluation
- **Pattern**: Always write failing tests first (TDD Red phase)

### @code-architect
- **Architecture**: Clean Architecture layers (domain/application/infrastructure)
- **LLM Patterns**: Circuit breakers, exponential backoff, graceful degradation
- **Quality**: Type hints, async/await, proper error handling

### @integration-tester
- **Scope**: API endpoints, database persistence, cache behavior, rate limiting
- **Performance**: Response time < 2s (p95), 99.5% success rate
- **Load Testing**: locust for concurrent request validation

### @quality-reviewer
- **Standards**: Clean Architecture compliance, security (OWASP), performance
- **LLM Focus**: Prompt injection prevention, token management, cost optimization
- **Tools**: Static analysis, dependency scanning, test coverage validation

## Default TDD Workflow

Unless project specifies otherwise, always follow this sequence:
1. **@requirements-analyst**: Decompose requirement into technical specs
2. **@test-designer**: Create comprehensive failing test suite
3. **@code-architect**: Implement minimal code to pass tests
4. **@integration-tester**: Validate service boundaries and performance
5. **@quality-reviewer**: Security, architecture, and optimization review
6. **Refactor**: Improve code while keeping tests green

## Global Quality Gates
- [ ] All tests pass (unit + integration + semantic)
- [ ] Test coverage ≥ 90%
- [ ] No security vulnerabilities (bandit, safety)
- [ ] Response times meet SLA requirements
- [ ] Clean Architecture boundaries respected
- [ ] LLM costs within budget targets

## Project Type Detection

Auto-detect project context and apply appropriate templates:

### Python + FastAPI + LLM Integration
- Apply LLM microservice patterns
- Include semantic evaluation testing
- Add circuit breaker and retry logic
- Implement token usage monitoring

### Python + Data Science + LLM
- Add notebook testing patterns
- Include data validation pipelines
- Focus on reproducibility and versioning

### General Python Projects
- Standard Clean Architecture
- Comprehensive pytest suite
- Type checking with mypy

## Quick Commands (Available Globally)

### Start New Feature
```
Hey Claude, implement: [FEATURE_DESCRIPTION]
Use my standard TDD workflow for Python LLM microservices.
```

### Agent Mode Switch
```
@[agent-name]: [specific task]
```

### Project Initialization  
```
Initialize a new Python LLM microservice project with:
- Clean Architecture structure
- FastAPI endpoints
- Comprehensive test suite
- Docker configuration
- CI/CD pipeline
```

### Code Review
```
Review this code using my quality standards:
[CODE]
```

## Context Inheritance Rules

1. **Global First**: Start with these global settings
2. **Project Override**: Project-specific CLAUDE.md can override globals
3. **Task Specific**: Inline instructions override both global and project settings

## My Common Patterns

### LLM Error Handling Template
```python
from tenacity import retry, stop_after_attempt, wait_exponential
from circuitbreaker import circuit

@circuit(failure_threshold=5, recovery_timeout=30)
@retry(stop=stop_after_attempt(3), wait=wait_exponential(multiplier=1, min=1, max=10))
async def call_llm_with_resilience(prompt: str) -> str:
    # Implementation with proper error handling
    pass
```

### Test Structure I Prefer
```python
# tests/unit/test_service.py - Always mock externals
# tests/integration/test_api.py - Test service boundaries  
# tests/semantic/test_llm_quality.py - Validate LLM outputs
# tests/performance/test_load.py - Performance validation
```

### Clean Architecture Structure I Use
```
src/
├── domain/           # Business logic (no external dependencies)
├── application/      # Use cases and DTOs
├── infrastructure/   # External adapters (LLM APIs, DBs)
└── presentation/     # FastAPI endpoints and middleware
```

## Personal Preferences
- **Error Messages**: Always actionable and specific
- **Logging**: Structured JSON with correlation IDs
- **Documentation**: Code should be self-documenting, comments for why not what
- **Performance**: Measure everything, optimize based on data
- **Security**: Assume everything is hostile, validate all inputs