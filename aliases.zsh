# Customm aliases can be put in here without cluttering the .zshrc file

# Start tmux if not already running
if [ -z "$TMUX" ]; then
    tmux -u attach -t COMMITCONFIRMED || tmux -u new -s COMMITCONFIRMED
fi

# Rename tmux window to hostname
if [ "$TMUX" ]; then
    tmux rename-window $HOSTNAME
fi

# SSH Aliases that will rename our window and log the session
alias tm="tmux -u attach -t COMMITCONFIRMED || tmux -u new -s COMMITCONFIRMED"
alias test-router1="tmux rename-window 'test-router1'; ssh admin@clab-test-router1 | tee log/test-router1_\$(date +%Y-%m-%d_%H-%M-%S).log"
alias test-router2="tmux rename-window 'test-router2'; ssh admin@clab-test-router2 | tee log/test-router2_\$(date +%Y-%m-%d_%H-%M-%S).log"
alias test-ansible="tmux rename-window 'test-ansible'; ssh ansible@clab-test-ansible | tee log/test-ansible_\$(date +%Y-%m-%d_%H-%M-%S).log"

