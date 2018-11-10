# Most common commands: 


ctrl-b c = create new window

ctrl-b , = rename current window

current window is shown with a *


to switch to next window:
ctrl-b then n

to switch to previous window:
ctrl-b then p


to show all windows:
ctrl-b then w


to split window virtically:
ctrl -b then % 


to split window horizontially:
ctrl -b then : then the command split-window


Sessions
=======

to create a session : tmux new -s [name of session]

ctrl -b then d will detatch you from the session

to list all sessions: tmux list-sessions or  tmux ls

to attach/re-attach to session: tmux attach -t [name of session]

tmux kill-session -t session-name

_______-----------------------------------------------------------------------------
**Advanced commands



# session management
tmux ls (or tmux list-sessions)
tmux new -s session-name
Ctrl-b d Detach from session
tmux attach -t [session name]
tmux kill-session -t session-name


Ctrl-b c Create new window
Ctrl-b d Detach current client
Ctrl-b l Move to previously selected window
Ctrl-b n Move to the next window
Ctrl-b p Move to the previous window
Ctrl-b & Kill the current window
Ctrl-b , Rename the current window
Ctrl-b q Show pane numbers (used to switch between panes)
Ctrl-b o Switch to the next pane
Ctrl-b ? List all keybindings

# moving between windows
Ctrl-b n (Move to the next window)
Ctrl-b p (Move to the previous window)
Ctrl-b l (Move to the previously selected window)
Ctrl-b w (List all windows / window numbers)
Ctrl-b window number (Move to the specified window number, the
default bindings are from 0 -- 9)


# Tiling commands
Ctrl-b % (Split the window vertically)
CTRL-b " (Split window horizontally)
Ctrl-b o (Goto next pane)
Ctrl-b q (Show pane numbers, when the numbers show up type the key to go to that pane)
Ctrl-b { (Move the current pane left)
Ctrl-b } (Move the current pane right)

# Make a pane its own window
Ctrl-b : "break-pane"



# add to ~/.tmux.conf
bind | split-window -h
bind - split-window -v


----------------------------------------------------------------------------
## Sharing sessions with sockets




