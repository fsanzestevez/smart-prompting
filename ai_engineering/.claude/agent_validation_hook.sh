#!/bin/bash

# Agent Validation Hook for Claude Code
# This hook requests human validation after each agent completes its task

# Color codes for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Function to display agent output summary
display_agent_output() {
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${WHITE}🤖 AGENT TASK COMPLETED${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo
    echo -e "${YELLOW}Agent:${NC} $1"
    echo -e "${YELLOW}Task:${NC} $2"
    echo -e "${YELLOW}Phase:${NC} $3"
    echo
    echo -e "${CYAN}──────────────────────────────────────────────────────────────────────────────${NC}"
}

# Function to request human validation
request_validation() {
    echo
    echo -e "${MAGENTA}🔍 HUMAN VALIDATION REQUIRED${NC}"
    echo
    echo -e "${WHITE}Please review the agent's output above and validate:${NC}"
    echo
    echo -e "  ${GREEN}1.${NC} Output Quality - Does it meet requirements?"
    echo -e "  ${GREEN}2.${NC} Technical Accuracy - Are the recommendations sound?"
    echo -e "  ${GREEN}3.${NC} Completeness - Are all aspects addressed?"
    echo -e "  ${GREEN}4.${NC} Risk Assessment - Are risks properly identified?"
    echo
    echo -e "${CYAN}──────────────────────────────────────────────────────────────────────────────${NC}"
    echo
    echo -e "${WHITE}Options:${NC}"
    echo -e "  ${GREEN}[A]pprove${NC} - Accept output and continue to next agent"
    echo -e "  ${YELLOW}[R]evise${NC} - Request agent to revise with feedback"
    echo -e "  ${RED}[S]top${NC} - Stop workflow for manual intervention"
    echo -e "  ${BLUE}[D]etails${NC} - View detailed agent output"
    echo
    read -p "Your decision [A/R/S/D]: " decision
    echo
    
    case ${decision,,} in
        a)
            echo -e "${GREEN}✓ Output approved. Proceeding to next step.${NC}"
            return 0
            ;;
        r)
            echo -e "${YELLOW}⟲ Revision requested.${NC}"
            read -p "Enter feedback for the agent: " feedback
            echo -e "${YELLOW}Feedback recorded: ${NC}$feedback"
            return 1
            ;;
        s)
            echo -e "${RED}⛔ Workflow stopped for manual intervention.${NC}"
            exit 1
            ;;
        d)
            echo -e "${BLUE}📋 Detailed output will be displayed...${NC}"
            return 2
            ;;
        *)
            echo -e "${RED}Invalid option. Defaulting to Stop.${NC}"
            exit 1
            ;;
    esac
}

# Function to check if agent requires validation
check_agent_validation() {
    local agent_name="$1"
    local task_description="$2"
    
    # Map agents to their workflow phases
    case $agent_name in
        "brainstormer"|"requirements-architect"|"data-scientist")
            phase="Phase 1: Initial Scoping"
            ;;
        "system-designer"|"model-engineer"|"implementation-planner")
            phase="Phase 2: System Design"
            ;;
        "tdd-coordinator"|"code-architect"|"qa-agent"|"insights-visualizer")
            phase="Phase 3: Execution"
            ;;
        "optimization-agent")
            phase="Phase 4: Optimization"
            ;;
        *)
            phase="Unknown Phase"
            ;;
    esac
    
    # Display agent completion
    display_agent_output "$agent_name" "$task_description" "$phase"
    
    # Request validation
    while true; do
        request_validation
        result=$?
        
        if [ $result -eq 0 ]; then
            # Approved
            break
        elif [ $result -eq 1 ]; then
            # Revision requested - would trigger agent re-run in real implementation
            echo -e "${YELLOW}Note: Agent revision would be triggered here${NC}"
            echo -e "${YELLOW}For now, continuing to next step...${NC}"
            break
        elif [ $result -eq 2 ]; then
            # Show details - in real implementation, would display full output
            echo -e "${BLUE}[Full agent output would be displayed here]${NC}"
            continue
        fi
    done
}

# Main execution
main() {
    # Check if this is an agent task completion
    if [ "$1" = "agent_complete" ]; then
        agent_name="$2"
        task_description="$3"
        
        # Trigger validation checkpoint
        check_agent_validation "$agent_name" "$task_description"
    fi
}

# Execute main function with all arguments
main "$@"