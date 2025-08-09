#!/bin/bash

# Claude Code Human Checkpoint Validator
# Enforces human approval for resource-intensive operations and workflow coordination

# Read the tool call data from stdin
TOOL_DATA=$(cat)

# Extract tool name and parameters
TOOL_NAME=$(echo "$TOOL_DATA" | jq -r '.tool_name // "unknown"')
TOOL_PARAMS=$(echo "$TOOL_DATA" | jq -r '.parameters // {}')

# Initialize default response
PERMISSION_DECISION="allow"
REASON=""
REQUIRE_CONFIRMATION=false

# Check for resource-intensive operations that need human approval
case "$TOOL_NAME" in
    "Bash")
        # Check for potentially expensive bash operations
        COMMAND=$(echo "$TOOL_PARAMS" | jq -r '.command // ""')
        
        # ML/Data Science resource-intensive operations
        if echo "$COMMAND" | grep -qE "(python.*train|python.*model|jupyter|pip install.*tensorflow|pip install.*torch|python.*process.*data|python.*analyze)"; then
            REQUIRE_CONFIRMATION=true
            REASON="🔬 ML/Data Science Operation Detected: This may consume significant compute resources. Review command: $COMMAND"
        
        # File operations that might affect large datasets
        elif echo "$COMMAND" | grep -qE "(rm -rf|delete|drop|truncate)"; then
            REQUIRE_CONFIRMATION=true
            REASON="⚠️ Destructive Operation Detected: Command may delete data. Review: $COMMAND"
        
        # Package installations that might take time/bandwidth
        elif echo "$COMMAND" | grep -qE "(npm install|pip install|apt install|brew install)"; then
            REQUIRE_CONFIRMATION=true
            REASON="📦 Package Installation Detected: May take time and bandwidth. Command: $COMMAND"
        fi
        ;;
        
    "Edit"|"MultiEdit"|"Write")
        # Check for critical file modifications
        FILE_PATH=$(echo "$TOOL_PARAMS" | jq -r '.file_path // ""')
        
        # Critical system files
        if echo "$FILE_PATH" | grep -qE "(\.claude/|requirements\.txt|pyproject\.toml|package\.json|Dockerfile)"; then
            REQUIRE_CONFIRMATION=true
            REASON="🔧 System Configuration Change: Modifying critical file: $FILE_PATH"
        fi
        ;;
        
    "WebSearch"|"WebFetch")
        # External web requests - may have cost or privacy implications
        REQUIRE_CONFIRMATION=true
        REASON="🌐 External Web Request: May incur costs or share data externally"
        ;;
esac

# Special workflow checkpoint detection
if echo "$TOOL_DATA" | grep -qE "(data.scientist|model.engineer|implementation.planner)"; then
    REQUIRE_CONFIRMATION=true
    REASON="🤖 Data Science Agent Detected: This operation may require resource validation (H2_DATA/H2_MODEL/H2_PLAN checkpoint)"
fi

# Generate response
if [ "$REQUIRE_CONFIRMATION" = true ]; then
    PERMISSION_DECISION="ask"
fi

# Output JSON response for Claude Code
cat << EOF
{
    "permissionDecision": "$PERMISSION_DECISION",
    "reason": "$REASON"
}
EOF