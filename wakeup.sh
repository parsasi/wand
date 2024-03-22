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

# Window 1
open_window_and_cd ~/Desktop/NDCSolutions_API
run_command "cd ~/Desktop/NDCSolutions_API/ && sh run.sh"
create_tab_and_run "cd ~/Desktop/NDCSolutions_API/ && lvim ."
create_tab_and_run "cd ~/Desktop/NDCSolutions_API/"

# Window 2
open_window_and_cd ~/Desktop/NDCSolutions_aggregator
run_command "cd ~/Desktop/NDCSolutions_aggregator && lvim ."
create_tab_and_run "cd ~/Desktop/NDCSolutions_aggregator && sudo yarn dev"
create_tab_and_run "cd ~/Desktop/NDCSolutions_aggregator"

# Window 3
open_window_and_cd ~/Desktop/BNWAPP
run_command "cd ~/Desktop/BNWAPP && lvim ."
create_tab_and_run "cd ~/Desktop/BNWAPP && php artisan serve"
create_tab_and_run "cd ~/Desktop/BNWAPP && mysql -u root -p"
create_tab_and_run "cd ~/Desktop/BNWAPP"

# Window 4
open_window_and_cd ~/Desktop/bnw-frontends/
run_coammdn "cd ~/Desktop/bnw-frontends && lvim ."
create_tab_and_run "cd ~/Desktop/bnw-frontends && sudo yarn watch:all"
create_tab_and_run "cd ~/Desktop/bnw-frontends/apps/public_agent && sudo yarn dev"
create_tab_and_run "cd ~/Desktop/bnw-frontends/"
