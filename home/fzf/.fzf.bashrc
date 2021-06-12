#!/bin/bash
if which rg > /dev/null; then
    DEFAULT_CMD="rg --files --hidden --no-ignore 2> /dev/null"
else
    DEFAULT_CMD="find -L ."
fi

export FZF_DEFAULT_COMMAND="$DEFAULT_CMD"
export FZF_DEFAULT_OPTS="--height 80% --layout=reverse"
export FZF_CTR_T_COMMAND="$DEFAULT_CMD"
export FZF_CTRL_T_OPTS="--preview '(([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} || ls -a {} | sed -e '1,2d')) || echo {}) 2> /dev/null | head -200'"
export FZF_COMPLETION_OPTS=""