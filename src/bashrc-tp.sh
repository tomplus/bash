# Instalation:
#
# Remove lines with HIST.* from ~/.bashrc
# Add line `~/.bashrc-tp.sh` to ~/.bashrc
#

if [ "$PS1" ]; then

    # Neverending history
    export HISTFILESIZE=9999999999
    export HISTSIZE=9999999999

    # don't put duplicate lines or lines starting with space in the history.
    HISTCONTROL=ignoreboth

    # Ignore simple commands
    export HISTIGNORE="ls:ls -alh:ll:ll -h:history:top:ps:ps axf:h:hh:hhh:hs"

    # Save after every command
    shopt -s histappend
    export PROMPT_COMMAND="history -a;"

    # h - history, hh - top 20 from last 1000, hhh - top 20 ever, hs - top ssh
    alias h="history"

    # hh - last top 20
    alias hh="tail -n 20000 ~/.bash_history | sort | uniq -c | sort -nr | head -n 20 | awk '{ gsub(/^ *[0-9]+ +/, \"\"); print;}'"

    # hhh - top 20 ever
    alias hhh="sort ~/.bash_history | sort | uniq -c | sort -nr | head -n 20 | awk '{ gsub(/^ *[0-9]+ +/, \"\"); print;}'"

    # hs - top ssh/scp
    alias hs="egrep \"^(ssh|scp)\" ~/.bash_history | sort | uniq -c | sort -nr | head -n 20 | awk '{ gsub(/^ *[0-9]+ +/, \"\"); print;}'"


    # Kubernetes
    if type kubectl >/dev/null 2>&1; then
        source <(kubectl completion bash)

        alias k="kubectl"
        source <(k completion bash | sed s/kubectl/k/g)
    fi

fi
