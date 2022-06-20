#!/data/data/com.termux/files/usr/bin bash


# 1. ASK FOR THE DIRECTORY TO BE USED  ----------------------------------------------- #

# If the directory is given then use it; else fzf to select the directory
if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find /mnt/c/Users/Enzo/Codes ~/.tmux ~/.config/nvim -type d -not -path '*/\.git*' | fzf)
fi

# If nothing is selected; then exit
if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)  # Take the basename and replace . with _
tmux_running=$(pgrep tmux)  # Check if tmux is running


# 2. CREATE A NEW SESSION WITH THE NAME OF THE DIRECTORY  ---------------------------- #


# If tmux is not running on a tmux session; then make a new one
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    in_a_tmux=false
    tmux new-session -s $selected_name -c $selected -d
fi

# If was called in a tmux session; then make a new session
if ! tmux has-session -t $selected_name 2> /dev/null; then
    in_a_tmux=true
    tmux new-session -ds $selected_name -c $selected
fi

# Rename the current window name
tmux rename-window -t $selected_name:1 editor


# 3. CREATE NECESSARY WINDOWS FOR THE SESSION ---------------------------------------- #

tmux neww -t $selected_name: -n logs -c $selected
tmux neww -t $selected_name: -n shell -c $selected

if [[ -f $selected/Pipfile ]]; then
    tmux send-keys -t $selected_name:editor "pipenv shell" Enter
    tmux send-keys -t $selected_name:logs "pipenv shell" Enter
    tmux send-keys -t $selected_name:shell "pipenv shell" Enter

    tmux send-keys -t $selected_name:editor "clear" Enter
    tmux send-keys -t $selected_name:logs "clear" Enter
    tmux send-keys -t $selected_name:shell "clear" Enter

    tmux send-keys -t $selected_name:editor "v" Enter
fi


# 4. SWITCH TO THE SESSION ----------------------------------------------------------- #
if [[ $in_a_tmux == true ]]; then
    tmux switch-client -t $selected_name
else
    tmux a -t $selected_name
fi


# ------------------------------------------------------------------------------------ #

# PARAMETER IDEAS:
# Not gonna be implemented unless I needed it lol
# - go to tmux session -ng (no go)
# - setup the window -ns (no setup)
# - check if to not execute pipenv -np (pipenv)
