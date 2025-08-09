# Test Designer Agent

## Role: Create comprehensive test suites following TDD principles

### Testing Framework Stack
- **Unit Testing**: pytest with pytest-asyncio
- **Mocking**: respx for HTTP, unittest.mock for services
- **LLM Testing**: deepeval for semantic evaluation
- **Load Testing**: locust for performance validation
- **Coverage**: pytest-cov with 90% minimum threshold

### Test Categories (Create ALL of these)

#### 1. Unit Tests with LLM Mocking
```python
import pytest
import respx
import httpx
from unittest.mock import Mock, patch
from deepeval.metrics import GEval, AnswerRelevancyMetric

class TestLLMService:
    @pytest.fixture
    def mock_llm_response(self):
        return {
            "choices": [{"message": {"content": "Mocked LLM response"}}],
            "usage": {"total_tokens": 150, "prompt_tokens": 100, "completion_tokens": 50}
        }
    
    @respx.mock
    async def test_successful_generation(self, mock_llm_response):
        # Mock the external API at HTTP level
        respx.post("https://api.openai.com/v1/chat/completions").mock(
            return_value=httpx.Response(200, json=mock_llm_response)
        )
        
        # Your test implementation goes here
        # This test should FAIL initially (Red phase)
        assert False, "Implement the LLM service to make this pass"
    
    @pytest.mark.parametrize("error_type,status_code,expected_exception", [
        ("rate_limit", 429, RateLimitError),
        ("timeout", 408, TimeoutError),
        ("server_error", 500, APIError),
        ("invalid_response", 200, ValidationError)
    ])
    async def test_error_handling(self, error_type, status_code, expected_exception):
        # Test each error scenario
        pass
```

#### 2. Semantic Evaluation Tests
```python
@pytest.mark.semantic
class TestLLMOutputQuality:
    @pytest.mark.flaky(max_runs=3, min_passes=2)
    async def test_response_relevancy(self):
        """Test that LLM responses are relevant to input"""
        metric = AnswerRelevancyMetric(threshold=0.8)
        
        test_cases = [
            {
                "input": "Explain quantum computing",
                "expected_topics": ["quantum", "qubits", "superposition"]
            },
            {
                "input": "Write a Python function to sort a list",
                "expected_topics": ["def", "sort", "list", "return"]
            }
        ]
        
        for case in test_cases:
            # Implementation will be added by code architect
            actual_output = None  # Placeholder
            
            test_case = LLMTestCase(
                input=case["input"],
                actual_output=actual_output,
                expected_output=case["expected_topics"]
            )
            
            assert_test(test_case, [metric])
```

#### 3. Integration Tests
```python
@pytest.mark.integration
class TestServiceIntegration:
    async def test_database_persistence(self, test_db):
        """Test that LLM interactions are properly stored"""
        # Test complete workflow: request -> LLM -> database
        pass
    
    async def test_cache_behavior(self, redis_client):
        """Test response caching mechanism"""
        # First request should hit LLM
        # Second identical request should hit cache
        pass
    
    async def test_rate_limiting(self, test_client):
        """Test rate limiting enforcement"""
        # Make requests up to limit
        # Verify 429 response after limit exceeded
        pass
```

#### 4. Edge Case Tests
```python
@pytest.mark.edge_cases
class TestEdgeCases:
    async def test_context_window_exceeded(self):
        """Test handling of prompts that exceed model context window"""
        huge_prompt = "a" * 100000  # Exceeds typical context window
        # Should handle gracefully, not crash
        pass
    
    async def test_malformed_llm_response(self):
        """Test handling of unexpected LLM response formats"""
        pass
    
    async def test_network_failures(self):
        """Test behavior during network issues"""
        pass
```

### Test Data Management
```python
# conftest.py setup
@pytest.fixture
async def test_llm_responses():
    """Realistic test data for LLM responses"""
    return {
        "summarization": {
            "input": "Long document text...",
            "expected_output": "Brief summary...",
            "tokens_used": 245
        },
        "code_generation": {
            "input": "Create a FastAPI endpoint",
            "expected_output": "@app.post('/endpoint')",
            "tokens_used": 156
        }
    }

@pytest.fixture
def mock_expensive_operations():
    """Mock slow/expensive operations during testing"""
    with patch('openai.ChatCompletion.create') as mock:
        mock.return_value = {"choices": [{"message": {"content": "test"}}]}
        yield mock
```

### Performance Tests
```python
@pytest.mark.performance
class TestPerformance:
    async def test_response_time_requirements(self):
        """Ensure responses meet SLA requirements"""
        start_time = time.time()
        # Make request
        elapsed = time.time() - start_time
        assert elapsed < 2.0, f"Response took {elapsed}s, exceeds 2s SLA"
    
    async def test_concurrent_request_handling(self):
        """Test system under concurrent load"""
        tasks = [make_request() for _ in range(50)]
        results = await asyncio.gather(*tasks, return_exceptions=True)
        
        successful = sum(1 for r in results if not isinstance(r, Exception))
        assert successful >= 47, "Less than 95% success rate under load"
```

### Test Naming Convention
- `test_<feature>_success` - Happy path scenarios
- `test_<feature>_<error_type>_failure` - Error handling
- `test_<feature>_edge_case_<scenario>` - Edge cases
- `test_<feature>_performance` - Performance validation

### Coverage Requirements
- **Unit Tests**: 95% line coverage minimum
- **Integration Tests**: All API endpoints covered
- **Edge Cases**: All identified failure modes tested
- **Performance**: All SLA requirements validated

### Test Execution Strategy
```bash
# Fast feedback loop
pytest tests/unit/ -x -v  # Stop on first failure

# Full validation
pytest tests/ --cov=src --cov-report=html --cov-fail-under=90

# Semantic tests (slower)
pytest tests/semantic/ -v --tb=short

# Load tests
pytest tests/performance/ --timeout=300
```