# -------------------------------------
# ----- Primary bash_aliases file -----
# -------------------------------------

# note: to link to this file from your local bashrc, add
# source /path/to/this/file

alias 'cls'='clear'
alias 'ls'='exa'
alias 'll'='ls -lh'
alias 'la'='ls -a'
alias 'cp'='cp -i'
alias 'peep'='nvim -R' # lol
alias 'mkdir'='mkdir -p'
alias 'python'='python3'
alias 'py'='python3'
alias 'nvi'='nvim'

# make and then cd into directory
mcd () {
    if [ $# -ne 1 ]; then
        echo "Expected name of directory to make. Ex: `mcd myproject`"
        exit 1
    fi
    mkdir -p $1
    cd $1
}

# open tmux on startup
if [ "$TMUX" = "" ]; then tmux; fi

# use these lines to change manpage reader. (but nvim is much slower than less)
# export MANPAGER='nvim +Man!'
# export MANWIDTH=999
