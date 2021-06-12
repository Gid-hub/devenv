#!/bin/bash
# Setup fzf
# ---------

# Auto completion
# ---------------
[[ $- == *i* ]] && source "~/fzf/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "~/fzf/key-bindings.bash"