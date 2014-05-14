#!/bin/bash -
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

function git_unadded_new {
    if git rev-parse --is-inside-work-tree &> /dev/null
    then
        if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null)  ]]
        then
            echo ""
        else
            echo "@ "
        fi
    fi
}

function git_needs_commit {
    if [[ "git rev-parse --is-inside-work-tree &> /dev/null)" != 'true'  ]] && git rev-parse --quiet --verify HEAD &> /dev/null
    then
        git diff-index --cached --quiet --ignore-submodules HEAD 2> /dev/null
        (( $? && $? != 128  )) && echo "@ "
    fi
}

function git_modified_files {
    if [[ "git rev-parse --is-inside-work-tree &> /dev/null)" != 'true'  ]] && git rev-parse --quiet --verify HEAD &> /dev/null
    then
        git diff --no-ext-diff --ignore-submodules --quiet --exit-code || echo "@ "
    fi
}

function short_pwd {
    echo $PWD | sed "s:${HOME}:~:" | sed "s:/\(.\)[^/]*:/\1:g" | sed "s:/[^/]*$:/$(basename $PWD):"
}

if [ `id -u` = 0  ]; then
    export COLOR="01;31m"
    export PATH_COLOR="01;31m"
else
    export COLOR="01;32m"
    export PATH_COLOR="01;34m"
fi

export BOLD_WHITE="01;37m"
export BOLD_CYAN="01;36m"
export BOLD_RED="01;31m"
export BOLD_GREEN="01;32m"
export BOLD_BLUE="01;34m"
export BOLD_PURPLE="01;35m"

export PS1='\[\033[$BOLD_CYAN\]\u@\[\033[$BOLD_PURPLE\]\h\[\033[00m\]:\[\033[01;$PATH_COLOR\]\W\[\033[00m\]\[\033[01;35m\]$(parse_git_branch)\[\033[00m\]\[\033[$BOLD_RED\]$(git_unadded_new)\[\033[00m\]\[\033[$BOLD_GREEN\]$(git_needs_commit)\[\033[00m\]\[\033[$BOLD_BLUE\]$(git_modified_files)\[\033[00m\]> '
# vim: tabstop=4 shiftwidth=4 autoindent
