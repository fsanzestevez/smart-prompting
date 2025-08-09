# LLM Microservice Development with Claude Code

## Project Overview
Python microservices that integrate with LLMs (OpenAI, Anthropic, etc.) following Clean Architecture and TDD principles.

## Development Standards

### Architecture
- **Pattern**: Clean Architecture with Domain-Driven Design
- **Framework**: FastAPI with async/await
- **Testing**: Test-Driven Development (TDD) with 90% coverage minimum
- **Dependency Injection**: Dishka for clean separation
- **Database**: PostgreSQL with async SQLAlchemy
- **Cache**: Redis for session and response caching

### Agent Specializations
When working on this project, act as one of these specialized agents based on the task:

- `@requirements-analyst`: Transform business needs into technical specifications
- `@test-designer`: Create comprehensive test suites before implementation
- `@code-architect`: Implement Clean Architecture code that passes tests
- `@integration-tester`: Validate system behavior and service interactions
- `@quality-reviewer`: Ensure code quality, security, and best practices

### TDD Workflow (MANDATORY)
1. **Requirements Analysis**: Break down features into user stories and domain models
2. **Test Design**: Write failing tests first (Red phase)
3. **Implementation**: Write minimal code to pass tests (Green phase)
4. **Integration Testing**: Validate service boundaries and API contracts
5. **Quality Review**: Security, performance, and architecture compliance
6. **Refactoring**: Improve code while keeping tests green

## LLM Integration Patterns

### Error Handling Requirements
```python
# Always implement these patterns:
- Circuit breakers for API calls
- Exponential backoff retry logic
- Rate limiting with user quotas
- Timeout handling (30s max)
- Graceful degradation strategies
```

### Testing Standards for LLM Code
```python
# Unit tests MUST mock all LLM calls
@respx.mock
async def test_llm_service():
    respx.post("https://api.openai.com/v1/chat/completions").mock(
        return_value=httpx.Response(200, json=mock_response)
    )
    # Test implementation

# Use semantic evaluation for integration tests
from deepeval.metrics import AnswerRelevancyMetric
metric = AnswerRelevancyMetric(threshold=0.8)
```

### Code Structure Template
```
src/
├── domain/                 # Business logic, entities, value objects
│   ├── entities/
│   ├── value_objects/
│   └── services/
├── application/           # Use cases, DTOs, interfaces
│   ├── use_cases/
│   ├── dtos/
│   └── interfaces/
├── infrastructure/        # External adapters (APIs, DBs, LLMs)
│   ├── gateways/         # LLM API adapters
│   ├── repositories/     # Data persistence
│   └── external/         # Third-party integrations
└── presentation/         # FastAPI endpoints, middleware
    ├── api/
    └── middleware/
```

## Task Execution Protocol

### When I request a feature:
1. Start with `@requirements-analyst` to decompose the requirement
2. Switch to `@test-designer` to create failing tests
3. Use `@code-architect` to implement the solution
4. Apply `@integration-tester` for end-to-end validation
5. Finish with `@quality-reviewer` for final checks

### Quality Gates
- [ ] All tests pass (unit + integration)
- [ ] Test coverage ≥ 90%
- [ ] No security vulnerabilities
- [ ] Response times < 2s (p95)
- [ ] Proper error handling for all edge cases
- [ ] Clean Architecture layers respected

## Current Focus Areas
- Single-prompt solutions (risk department approved)
- Multi-agent LLM workflows (internal tools)
- CRUD operations with LLM enhancement
- Pure microservices (stateless request/response)

## Quick Commands
- `claude test` - Run full test suite with coverage
- `claude agent <role>` - Switch to specific agent mode
- `claude workflow tdd` - Start TDD cycle for new feature
- `claude review` - Comprehensive code quality check