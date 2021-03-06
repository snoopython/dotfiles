# .bashrc
# =======


# aliases
# -------
alias ls="ls -FG"
alias ll="ls -FGalsh"
alias lf="ls | fzf"
alias reload="source ~/.bash_profile"


# terminal cosmetics
# ------------------
cname=`scutil --get ComputerName`

if [ ${cname} = "Woodstock" ]; then
    character="ﾐ'ﾌ"
elif [ ${cname} = "Snoopy" ]; then
    character='@´\`･)'
fi

cY="\[\e[33m\]"
cB="\[\e[34m\]"
cE="\[\e[m\]"

export PS1="${cY}${character} ${cB}[${cE}\!${cB}]${cE}:\W $ "


# homebrew
# --------

# enhancd
source /usr/local/etc/enhancd/init.sh
export ENHANCD_DISABLE_HOME=1
export ENHANCD_DOT_ARG="../"
export ENHANCD_FILTER=fzf

# finder-cli
source /usr/local/etc/finder-cli/init.sh

# rmsafe
alias rm="rmsafe"


# Python
# ------

# Anaconda
alias conda-activate="source ~/.pyenv/versions/miniconda3-latest/bin/activate"
alias conda-deactivate="source ~/.pyenv/versions/miniconda3-latest/bin/deactivate"


# Tools
# -----

# am
export AM_CACHE_PATH=~/.am


# tmux
# ----
if [[ -z "${TMUX}" ]]; then
    if ! tmux has >/dev/null 2>&1; then
        tmux new
    else
        target=`tmux ls | fzf --select-1 | cut -d: -f1`
        tmux attach -t ${target}
    fi
fi
