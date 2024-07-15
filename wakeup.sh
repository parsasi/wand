#!/bin/bash

# Function to open a new window and set directory
function open_window_and_cd {
    osascript -e 'tell application "iTerm" to create window with default profile'
    sleep 2
    osascript -e 'tell application "iTerm" to tell current window to tell current session to write text "cd '"$1"'"'
}

# Function to create a new tab and run command
function create_tab_and_run {
    osascript -e 'tell application "iTerm" to tell current window to create tab with default profile'
    sleep 1
    osascript -e 'tell application "iTerm" to tell current session of current window to write text "'"$1"'"'
}

function create_tab {
    osascript -e 'tell application "iTerm" to tell current window to create tab with default profile'
}

function run_command {
    osascript -e 'tell application "iTerm" to tell current session of current window to write text "'"$1"'"'
}


function create_agg_tmux_windows {
   # Create a variable for the name of the session
    local session_name="agg"
    local session_path="~/Documents/NDCSolutions_aggregator"
  
    create_tab_and_run "cd $session_path"

    # Attach to the session
    tmux new-session -s "$session_name" -d

    # Create a new tmux session/window for each directory
    #rename the inital window to lvim
    tmux new-window -d -c "$session_name"

    tmux new-window -d -c "$session_name"

    tmux new-window -d -c "$session_name"

    tmux rename-window -t "$session_name:0" "lvim"

    tmux rename-window -t "$session_name:1" "server"

    tmux rename-window -t "$session_name:2" "root"

    tmux send-keys -t "$session_name:0" "cd $session_path && lvim ." C-m

    tmux send-keys -t "$session_name:1" "cd $session_path && sudo yarn dev" C-m

    tmux send-keys -t "$session_name:2" "cd $session_path" C-m

    tmux kill-window -t "$session_name:3"

    run_command "tmux attach -t $session_name"

  
}

function create_ndc_tmux_windows { 
   # Create a variable for the name of the session
    local session_name="ndc"
    local session_path="~/Documents/NDCSolutions_API"

    create_tab_and_run "cd $session_path"

    # Attach to the session
    tmux new-session -s "$session_name" -d

    # Create a new tmux session/window for each directory
    #rename the inital window to lvim
    tmux new-window -d -c "$session_name"

    tmux new-window -d -c "$session_name"

    tmux new-window -d -c "$session_name"

    tmux rename-window -t "$session_name:0" "lvim"

    tmux rename-window -t "$session_name:1" "server"

    tmux rename-window -t "$session_name:2" "root"

    tmux send-keys -t "$session_name:0" "cd $session_path && lvim ." C-m

    tmux send-keys -t "$session_name:1" "cd $session_path && sh run.sh" C-m

    tmux send-keys -t "$session_name:2" "cd $session_path" C-m

    tmux kill-window -t "$session_name:3"

    run_command "tmux attach -t $session_name"

  
}


function create_bnw_tmux_windows { 
   # Create a variable for the name of the session
    local session_name="bnw"
    local session_path="~/Documents/BNWAPP"

    create_tab_and_run "cd $session_path"

    # Attach to the session
    tmux new-session -s "$session_name" -d

    # Create a new tmux session/window for each directory
    #rename the inital window to lvim
    tmux new-window -d -c "$session_name"

    tmux new-window -d -c "$session_name"
    
    tmux new-window -d -c "$session_name"

    tmux new-window -d -c "$session_name"

    tmux rename-window -t "$session_name:0" "lvim"

    tmux rename-window -t "$session_name:1" "server"

    tmux rename-window -t "$session_name:2" "mysql"

    tmux rename-window -t "$session_name:3" "root"

    tmux send-keys -t "$session_name:0" "cd $session_path && lvim ." C-m

    tmux send-keys -t "$session_name:1" "cd $session_path && php artisan serve" C-m

    tmux send-keys -t "$session_name:2" "cd $session_path && mysql -u root" C-m

    tmux send-keys -t "$session_name:3" "cd $session_path" C-m

    tmux kill-window -t "$session_name:4"

    run_command "tmux attach -t $session_name"
}

function create_fre_tmux_windows { 
   # Create a variable for the name of the session
    local session_name="fre"
    local session_path="~/Documents/bnw-frontends"

    create_tab_and_run "cd $session_path"

    # Attach to the session
    tmux new-session -s "$session_name" -d

    # Create a new tmux session/window for each directory
    #rename the inital window to lvim
    tmux new-window -d -c "$session_name"

    tmux new-window -d -c "$session_name"

    tmux new-window -d -c "$session_name"

    tmux new-window -d -c "$session_name"

    tmux rename-window -t "$session_name:0" "lvim"

    tmux rename-window -t "$session_name:1" "packages"

    tmux rename-window -t "$session_name:2" "server"

    tmux rename-window -t "$session_name:3" "root"
    
    tmux send-keys -t "$session_name:0" "cd $session_path && lvim ." C-m

    tmux send-keys -t "$session_name:1" "cd $session_path && sudo yarn watch:all" C-m
    
    tmux send-keys -t "$session_name:2" "cd $session_path/apps/public_agent && sudo yarn build" C-m

    tmux send-keys -t "$session_name:3" "cd $session_path" C-m

    tmux kill-window -t "$session_name:4"

    run_command "tmux attach -t $session_name"
}

create_fre_tmux_windows
create_bnw_tmux_windows
create_agg_tmux_windows
create_ndc_tmux_windows

