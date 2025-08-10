# TDD-First FastAPI Microservice Development

## 🛑 MANDATORY AGENT VALIDATION PROTOCOL

### Before EVERY Agent Execution:
```
🤖 AGENT REQUEST
================
Agent: [agent-type]
Task: [description]
Purpose: [what we're achieving]

➡️ Approve this agent? (yes/no)
```

**I MUST**:
1. STOP and present the above request
2. WAIT for explicit approval (yes/proceed/go ahead)
3. ABORT if user says no or provides different instructions

### After EVERY Agent Completion:

**I MUST**:
1. DISPLAY the FULL agent output (no summarization)
2. WAIT for user to review all options/recommendations
3. ASK: "➡️ How would you like to proceed?"
4. ONLY continue after user provides direction

**CRITICAL**: 
- NEVER summarize agent outputs
- ALWAYS show complete results including all options
- Let USER choose from agent-provided options
- ONE AGENT AT A TIME - no parallel execution

---

## Workflow Overview

This command executes a specialized TDD-first development workflow designed for FastAPI microservices, emphasizing:
- **Domain-informed TDD**: Red-Green-Refactor cycles with business domain understanding
- **Clean Architecture**: Proper layer separation (Domain → Application → Infrastructure → Presentation)
- **Given-When-Then Testing**: BDD-structured test cases across all layers
- **Mock-First Strategy**: Comprehensive external dependency mocking (no real I/O in tests)
- **Poetry + pytest Integration**: Modern Python tooling with proper dependency management

## Agent Coordination

### Phase 1: TDD Architecture Planning (with ML Resource Validation)
- **@tdd-coordinator**: Establishes TDD workflow protocols and test execution strategy
- **@qa-agent**: Designs comprehensive testing architecture with Given-When-Then structure
- **@code-architect**: Plans Clean Architecture scaffold with TDD-compatible interfaces
- **@data-scientist** (if ML features): Proposes ML data strategy with cost/time estimates
- **@model-engineer** (if ML features): Designs ML integration approach for FastAPI
- **Human Checkpoint**: Review TDD approach, ML resource requirements, and approve testing strategy

### Phase 2: Red Phase Execution (Failing Tests)
- **@tdd-coordinator**: Orchestrates failing test generation and validates proper failure reasons
- **@qa-agent**: Generates Given-When-Then structured tests for all functionality layers
- **@code-architect**: Creates minimal interface definitions to enable test compilation
- **Human Checkpoint**: Review test coverage and Given-When-Then structure

### Phase 3: Green Phase Execution (Minimal Implementation)  
- **@tdd-coordinator**: Validates minimal implementation approach and test passage
- **@code-architect**: Implements just enough code to make tests pass (no over-engineering)
- **@qa-agent**: Validates test passage and mock integration
- **Human Checkpoint**: Review implementation minimalism and architecture adherence

### Phase 4: Refactor Phase Execution (Clean Architecture)
- **@tdd-coordinator**: Guides refactoring while maintaining test passage
- **@code-architect**: Refactors for Clean Architecture compliance and SOLID principles
- **@qa-agent**: Validates continued test passage and quality improvements
- **Human Checkpoint**: Final review of Clean Architecture implementation and TDD adherence

## Technical Stack

**Core Technologies**:
- **FastAPI**: Async web framework with automatic OpenAPI documentation
- **Poetry**: Dependency management and virtual environment handling
- **pytest**: Testing framework with async support and fixture management
- **TestClient**: FastAPI testing client for endpoint integration testing

**Testing Libraries**:
- `pytest-asyncio`: Async test execution support
- `pytest-cov`: Code coverage reporting and analysis
- `pytest-mock`: Advanced mocking capabilities
- `httpx-mock`: HTTP client mocking for external API tests
- `responses`: HTTP response mocking library
- `factory-boy`: Test data generation and factory patterns

## Project Structure Template

```
fastapi-microservice/
├── pyproject.toml              # Poetry dependencies and pytest configuration
├── README.md                   # Setup and usage instructions
├── .gitignore                  # Python-specific gitignore
├── Makefile                    # Common commands (test, lint, run)
├── src/
│   ├── __init__.py
│   ├── main.py                 # FastAPI app factory and startup
│   ├── domain/                 # Pure business logic (no external dependencies)
│   │   ├── __init__.py
│   │   ├── entities/           # Business entities and value objects
│   │   ├── use_cases/          # Business use case interfaces
│   │   └── exceptions.py       # Domain-specific exceptions
│   ├── application/            # Application services and orchestration
│   │   ├── __init__.py
│   │   ├── services/           # Use case implementations
│   │   ├── interfaces/         # Repository and external service interfaces
│   │   └── dto/               # Data transfer objects
│   ├── infrastructure/         # External adapters (all mocked in tests)
│   │   ├── __init__.py
│   │   ├── repositories/       # Database adapters
│   │   ├── external_services/  # HTTP clients, API adapters
│   │   └── config.py          # Configuration management
│   └── presentation/           # FastAPI routers and dependency injection
│       ├── __init__.py
│       ├── routers/            # FastAPI endpoint definitions
│       ├── dependencies.py     # Dependency injection setup
│       ├── middleware.py       # FastAPI middleware
│       └── models/            # Pydantic request/response models
└── tests/
    ├── __init__.py
    ├── conftest.py             # Shared fixtures and mock setup
    ├── unit/                   # Layer-specific unit tests
    │   ├── domain/             # Domain logic tests (no mocks)
    │   ├── application/        # Application service tests (mocked infrastructure)
    │   └── infrastructure/     # Infrastructure tests (comprehensive mocking)
    └── integration/            # FastAPI endpoint tests (TestClient)
```

## TDD Cycle Example

### Red Phase: Failing Test Generation
```python
def test_create_user_endpoint():
    # Given: Valid user data and mocked service
    user_data = {"name": "John Doe", "email": "john@example.com"}
    expected_user = {"id": 1, "name": "John Doe", "email": "john@example.com"}
    mock_user_service.create_user.return_value = expected_user
    
    # When: POST request to create user
    response = client.post("/users", json=user_data)
    
    # Then: User created successfully
    assert response.status_code == 201
    assert response.json() == expected_user
    mock_user_service.create_user.assert_called_once_with(user_data)
```

### Green Phase: Minimal Implementation
```python
@router.post("/", status_code=201)
async def create_user(
    request: CreateUserRequest,
    user_service: UserServiceInterface = Depends(get_user_service)
):
    user = await user_service.create_user(request.dict())
    return user
```

### Refactor Phase: Clean Architecture Enhancement
- Extract domain validation logic
- Implement proper dependency injection
- Add error handling with HTTPException mapping
- Optimize async patterns and response models

## Quality Gates

**Test Coverage Requirements**:
- Domain logic: Minimum 95% coverage
- Application services: Minimum 90% coverage  
- Infrastructure adapters: Minimum 85% coverage
- Presentation layer: Minimum 80% coverage

**TDD Compliance Validation**:
- All functionality implemented through Red-Green-Refactor cycles
- Given-When-Then structure in all test cases
- Complete external dependency mocking (no real I/O)
- Clean Architecture layer separation maintained

**Performance Benchmarks**:
- Full test suite execution: Under 30 seconds
- Individual test isolation: Each test runs independently
- FastAPI startup time: Under 2 seconds
- API response times: Under 200ms for standard operations

## Human Checkpoints

**Checkpoint 1: TDD Strategy Approval**
- Review proposed testing architecture and Given-When-Then structure
- Approve external dependency mocking strategy
- Validate Clean Architecture layer planning

**Checkpoint 2: Red Phase Validation**  
- Review failing test coverage and structure
- Confirm Given-When-Then implementation quality
- Approve test isolation and mock setup

**Checkpoint 3: Green Phase Review**
- Validate minimal implementation approach (no over-engineering)
- Review test passage and FastAPI endpoint functionality  
- Confirm mock integration and async pattern usage

**Checkpoint 4: Refactor Phase Approval**
- Review Clean Architecture compliance and SOLID principle adherence
- Validate continued test passage during refactoring
- Approve final implementation quality and documentation

## Usage

```
/project:tdd-microservice "Create a user management microservice with CRUD operations, email validation, and external notification integration"
```

This command will guide you through TDD-first development with proper agent coordination, human checkpoints, and comprehensive quality validation.

## Integration with Full Workflow

This command represents a specialized Phase 3 implementation for the `/project:full-workflow` command, focusing specifically on TDD-disciplined execution when microservice development is the chosen implementation approach.

Can be used:
- **Standalone**: For focused FastAPI microservice development with TDD discipline
- **Integrated**: As the execution phase within the broader 4-phase development workflow