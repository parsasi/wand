#!/bin/bash

function create_agg_tmux_windows {
   # Create a variable for the name of the session
    local session_name="agg"
    local session_path="~/Documents/NDCSolutions_aggregator"

    # Check if session already exists
    if tmux has-session -t "$session_name" 2>/dev/null; then
        echo "Session $session_name already exists, skipping..."
        return
    fi

    # Create tmux session in background
    tmux new-session -s "$session_name" -d

    # Create additional windows
    tmux new-window -d -t "$session_name"
    tmux new-window -d -t "$session_name"
    tmux new-window -d -t "$session_name"

    # Rename windows
    tmux rename-window -t "$session_name:0" "lvim"
    tmux rename-window -t "$session_name:1" "server"
    tmux rename-window -t "$session_name:2" "root"

    # Send commands to windows
    tmux send-keys -t "$session_name:0" "cd $session_path && lvim ." C-m
    tmux send-keys -t "$session_name:1" "cd $session_path && sudo yarn dev" C-m
    tmux send-keys -t "$session_name:2" "cd $session_path" C-m

    # Clean up extra window
    tmux kill-window -t "$session_name:3"
}

function create_ndc_tmux_windows { 
   # Create a variable for the name of the session
    local session_name="ndc"
    local session_path="~/Documents/NDCSolutions_API"

    # Check if session already exists
    if tmux has-session -t "$session_name" 2>/dev/null; then
        echo "Session $session_name already exists, skipping..."
        return
    fi

    # Create tmux session in background
    tmux new-session -s "$session_name" -d

    # Create additional windows
    tmux new-window -d -t "$session_name"
    tmux new-window -d -t "$session_name"
    tmux new-window -d -t "$session_name"

    # Rename windows
    tmux rename-window -t "$session_name:0" "lvim"
    tmux rename-window -t "$session_name:1" "server"
    tmux rename-window -t "$session_name:2" "root"

    # Send commands to windows
    tmux send-keys -t "$session_name:0" "cd $session_path && lvim ." C-m
    tmux send-keys -t "$session_name:1" "cd $session_path && sh run.sh" C-m
    tmux send-keys -t "$session_name:2" "cd $session_path" C-m

    # Clean up extra window
    tmux kill-window -t "$session_name:3"
}


function create_bnw_tmux_windows { 
   # Create a variable for the name of the session
    local session_name="bnw"
    local session_path="~/Documents/BNWAPP"

    # Check if session already exists
    if tmux has-session -t "$session_name" 2>/dev/null; then
        echo "Session $session_name already exists, skipping..."
        return
    fi

    # Create tmux session in background
    tmux new-session -s "$session_name" -d

    # Create additional windows
    tmux new-window -d -t "$session_name"
    tmux new-window -d -t "$session_name"
    tmux new-window -d -t "$session_name"
    tmux new-window -d -t "$session_name"

    # Rename windows
    tmux rename-window -t "$session_name:0" "lvim"
    tmux rename-window -t "$session_name:1" "server"
    tmux rename-window -t "$session_name:2" "mysql"
    tmux rename-window -t "$session_name:3" "root"

    # Send commands to windows
    tmux send-keys -t "$session_name:0" "cd $session_path && lvim ." C-m
    tmux send-keys -t "$session_name:1" "cd $session_path && php artisan serve" C-m
    tmux send-keys -t "$session_name:2" "cd $session_path && mysql -u root" C-m
    tmux send-keys -t "$session_name:3" "cd $session_path" C-m

    # Clean up extra window
    tmux kill-window -t "$session_name:4"
}

function create_fre_tmux_windows { 
   # Create a variable for the name of the session
    local session_name="fre"
    local session_path="~/Documents/bnw-frontends"

    # Check if session already exists
    if tmux has-session -t "$session_name" 2>/dev/null; then
        echo "Session $session_name already exists, skipping..."
        return
    fi

    # Create tmux session in background
    tmux new-session -s "$session_name" -d

    # Create additional windows
    tmux new-window -d -t "$session_name"
    tmux new-window -d -t "$session_name"
    tmux new-window -d -t "$session_name"
    tmux new-window -d -t "$session_name"

    # Rename windows
    tmux rename-window -t "$session_name:0" "lvim"
    tmux rename-window -t "$session_name:1" "packages"
    tmux rename-window -t "$session_name:2" "server"
    tmux rename-window -t "$session_name:3" "root"

    # Send commands to windows
    tmux send-keys -t "$session_name:0" "cd $session_path && lvim ." C-m
    tmux send-keys -t "$session_name:1" "cd $session_path && sudo yarn watch:all" C-m
    tmux send-keys -t "$session_name:2" "cd $session_path/apps/public_agent && sudo yarn dev" C-m
    tmux send-keys -t "$session_name:3" "cd $session_path" C-m

    # Clean up extra window
    tmux kill-window -t "$session_name:4"
}

function create_orx_tmux_windows {
   # Create a variable for the name of the session
    local session_name="orx"
    local session_path="~/Documents/orx-api"

    # Check if session already exists
    if tmux has-session -t "$session_name" 2>/dev/null; then
        echo "Session $session_name already exists, skipping..."
        return
    fi

    # Create tmux session in background
    tmux new-session -s "$session_name" -d

    # Create additional windows
    tmux new-window -d -t "$session_name"
    tmux new-window -d -t "$session_name"
    tmux new-window -d -t "$session_name"

    # Rename windows
    tmux rename-window -t "$session_name:0" "lvim"
    tmux rename-window -t "$session_name:1" "dev"
    tmux rename-window -t "$session_name:2" "empty1"
    tmux rename-window -t "$session_name:3" "empty2"

    # Send commands to windows
    tmux send-keys -t "$session_name:0" "cd $session_path && lvim ." C-m
    tmux send-keys -t "$session_name:1" "cd $session_path && yarn run start dev" C-m
    tmux send-keys -t "$session_name:2" "cd $session_path" C-m
    tmux send-keys -t "$session_name:3" "cd $session_path" C-m

    # Clean up extra window
    tmux kill-window -t "$session_name:4"
}

function create_doc_tmux_windows {
   # Create a variable for the name of the session
    local session_name="doc"
    local session_path="~/Documents/docker-compose-deployment"

    # Check if session already exists
    if tmux has-session -t "$session_name" 2>/dev/null; then
        echo "Session $session_name already exists, skipping..."
        return
    fi

    # Create tmux session in background
    tmux new-session -s "$session_name" -d

    # Create additional window
    tmux new-window -d -t "$session_name"

    # Rename windows
    tmux rename-window -t "$session_name:0" "empty1"
    tmux rename-window -t "$session_name:1" "empty2"

    # Send commands to windows (just cd to path)
    tmux send-keys -t "$session_name:0" "cd $session_path" C-m
    tmux send-keys -t "$session_name:1" "cd $session_path" C-m

    # Clean up extra window
    tmux kill-window -t "$session_name:2"
}

tmux source-file ~/wand/.tmux.conf
create_fre_tmux_windows
create_bnw_tmux_windows
create_agg_tmux_windows
create_ndc_tmux_windows
create_orx_tmux_windows
create_doc_tmux_windows
