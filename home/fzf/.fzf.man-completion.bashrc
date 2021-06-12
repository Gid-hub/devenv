#!/bin/bash
_fzf_complete_man() {
    _fzf_complete --multi --reverse --header-lines=3 -- "$@" < <(
        find $(manpath | tr ":" " ") -name "*.gz" | rev | cut -f1 -d/ | sed -E "s/^zg\.([0-9])\.(.*)$/\2 \1/g" | rev | sort -u
    )
}

_fzf_complete_man_post() {
    awk  -v q='"' ' {print $1 " " q $2 q}'
}

_fzf_complete_man_notrigger() {
    FZF_COMPLETION_TRIGGER='' _fzf_complete_man
}

[ -n "$BASH" ] && complete -F _fzf_complete_man_notrigger -o default -o bashdefault man
