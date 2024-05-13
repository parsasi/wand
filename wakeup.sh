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


# # Directories to open in tmux windows
# directories=(
#     "NDCSolutions_aggregator"
# )

# # Function to create tmux windows with panes
# function create_tmux_windows {
#     local dir_index=0

#     # Loop through each directory
#     for dir in "${directories[@]}"; do
#         # Attach to the session
#         tmux new-session -s $dir -d

#         # Create a new tmux session/window for each directory
#         tmux new-window -d -c "$dir" 

#         # Split window horizontally
#         tmux split-window -h -c "$dir"

#         # Split the right pane vertically
#         tmux split-window -v -c "$dir"

#         # Select pane 1 (left pane)
#         tmux select-pane -t 1 

#         # Move to the next directory
#         ((dir_index++))
#     done

# }


function create_agg_tmux_windows {
   # Create a variable for the name of the session
    local session_name="agg"
    local session_path="~/Desktop/NDCSolutions_aggregator"
  
    open_window_and_cd $session_path

    # Attach to the session
    tmux new-session -s "$session_name" -d

    # Create a new tmux session/window for each directory
    #rename the inital window to lvim
    tmux new-window -d -c "$session_name" -n "lvim"

    tmux new-window -d -c "$session_name" -n "server"

    tmux new-window -d -c "$session_name" -n "root"

    tmux send-keys -t "$session_name:0" "cd $session_path && lvim ." C-m

    tmux send-keys -t "$session_name:1" "cd $session_path && sudo yarn dev" C-m

    tmux send-keys -t "$session_name:2" "cd $session_path" C-m

    tmux kill-window -t "$session_name:3"

    run_command "tmux attach -t $session_name"

  
}

function create_ndc_tmux_windows { 
   # Create a variable for the name of the session
    local session_name="ndc"
    local session_path="~/Desktop/NDCSolutions_API"

    open_window_and_cd $session_path

    # Attach to the session
    tmux new-session -s "$session_name" -d

    # Create a new tmux session/window for each directory
    #rename the inital window to lvim
    tmux new-window -d -c "$session_name" -n "lvim"

    tmux new-window -d -c "$session_name" -n "server"

    tmux new-window -d -c "$session_name" -n "root"

    tmux send-keys -t "$session_name:0" "cd $session_path && lvim ." C-m

    tmux send-keys -t "$session_name:1" "cd $session_path && sh run.sh" C-m

    tmux send-keys -t "$session_name:2" "cd $session_path" C-m

    tmux kill-window -t "$session_name:3"

    run_command "tmux attach -t $session_name"

  
}


function create_bnw_tmux_windows { 
   # Create a variable for the name of the session
    local session_name="bnw"
    local session_path="~/Desktop/BNWAPP"

    open_window_and_cd $session_path

    # Attach to the session
    tmux new-session -s "$session_name" -d

    # Create a new tmux session/window for each directory
    #rename the inital window to lvim
    tmux new-window -d -c "$session_name" -n "lvim"

    tmux new-window -d -c "$session_name" -n "server"
    
    tmux new-window -d -c "$session_name" -n "mysql"

    tmux new-window -d -c "$session_name" -n "root"

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
    local session_path="~/Desktop/bnw-frontends"

    open_window_and_cd $session_path

    # Attach to the session
    tmux new-session -s "$session_name" -d

    # Create a new tmux session/window for each directory
    #rename the inital window to lvim
    tmux new-window -d -c "$session_name" -n "lvim"

    tmux new-window -d -c "$session_name" -n "packages"

    tmux new-window -d -c "$session_name" -n "server"

    tmux new-window -d -c "$session_name" -n "root"
    
    tmux send-keys -t "$session_name:0" "cd $session_path && lvim ." C-m

    tmux send-keys -t "$session_name:1" "cd $session_path && sudo yarn watch:all" C-m
    
    tmux send-keys -t "$session_name:2" "cd $session_path/apps/public_agent && sudo yarn build" C-m

    tmux send-keys -t "$session_name:3" "cd $session_path" C-m

    tmux kill-window -t "$session_name:4"

    run_command "tmux attach -t $session_name"
}

create_agg_tmux_windows
create_ndc_tmux_windows
create_bnw_tmux_windows
create_fre_tmux_windows

