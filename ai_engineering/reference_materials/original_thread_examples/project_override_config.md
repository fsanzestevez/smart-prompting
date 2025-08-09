# Project: Customer Support Chatbot

## Inherits: ~/.claude/CLAUDE.md (Global Python LLM microservice standards)

## Project-Specific Overrides

### Business Context
- **Domain**: Customer support automation
- **Risk Level**: High (customer-facing)
- **Compliance**: GDPR, SOC2 requirements

### Additional Requirements
- **Response Time**: < 1s (p95) for cached responses, < 3s for LLM calls
- **Availability**: 99.9% uptime SLA
- **Security**: PII detection and redaction mandatory
- **Cost Target**: < $0.02 per conversation

### Project-Specific Agents

#### @pii-analyzer (Additional Agent)
- **Role**: Detect and redact personally identifiable information
- **Tools**: spaCy NER, custom regex patterns, presidio
- **Output**: Sanitized text + redaction report

### Enhanced Error Scenarios
Beyond global LLM patterns, also test:
- PII detection failures
- GDPR compliance violations  
- Customer escalation triggers
- Multi-language support edge cases

### Monitoring Requirements
- Customer satisfaction scores
- Escalation rates to human agents
- PII exposure incidents (must be zero)
- Cost per conversation tracking

### Quick Commands (Project-Specific)
```bash
# Analyze customer conversation for PII
@pii-analyzer: Check this conversation for sensitive data: [CONVERSATION]

# Test customer scenario
@test-designer: Create tests for this customer scenario: [SCENARIO]
Include PII handling and escalation triggers.

# Review for compliance
@quality-reviewer: Ensure this code meets GDPR and SOC2 requirements: [CODE]
```

## Usage: Global + Project Configuration