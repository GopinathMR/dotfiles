# ref : https://danielmiessler.com/study/tmux/
# Remap window navigation to vim
# unbind-key j
# bind-key j select-pane -D
# unbind-key k
# bind-key k select-pane -U
# unbind-key h
# bind-key h select-pane -L
# unbind-key l
# bind-key l select-pane -R

set -g status-left "#[fg=Green]#(whoami)#[fg=white]::#[fg=blue] \
(hostname - s)#[fg=white]::##[fg=yellow]#(curl ipecho.net/plain;echo)"
set -g status-justify left
set -g status-right '#[fg=Cyan]#S #[fg=white]%a %d %b %R' 

# Rename your terminals
set -g set-titles on
set -g set-titles-string '#(whoami)::#h::#(curl ipecho.net/plain;echo)'
