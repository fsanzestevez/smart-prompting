#!/bin/bash

# Test script to validate the checkpoint hook system
echo "Testing Claude Code Checkpoint Hook System"
echo "=========================================="

# Test 1: Safe operation (should allow)
echo "Test 1: Safe mkdir operation"
echo '{"tool_name": "Bash", "parameters": {"command": "mkdir test_dir"}}' | ./claude_checkpoint.sh
echo ""

# Test 2: ML operation (should require confirmation)
echo "Test 2: ML training operation"
echo '{"tool_name": "Bash", "parameters": {"command": "python train_model.py"}}' | ./claude_checkpoint.sh
echo ""

# Test 3: Destructive operation (should require confirmation)
echo "Test 3: Destructive operation"
echo '{"tool_name": "Bash", "parameters": {"command": "rm -rf data/"}}' | ./claude_checkpoint.sh
echo ""

# Test 4: Web search (should require confirmation)
echo "Test 4: Web search operation"
echo '{"tool_name": "WebSearch", "parameters": {"query": "test search"}}' | ./claude_checkpoint.sh
echo ""

# Test 5: Critical file edit (should require confirmation)  
echo "Test 5: Critical file modification"
echo '{"tool_name": "Edit", "parameters": {"file_path": ".claude/settings.local.json"}}' | ./claude_checkpoint.sh
echo ""

echo "Test completed!"