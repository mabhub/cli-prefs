alias gs='git status'

alias gaa='git add -A'
alias ga='git add'

alias go='git checkout'

alias gd='git diff'
alias gdw='git diff --color-words'

alias gl='git log --graph --decorate --all'
alias glog='git log --graph --oneline --all --decorate'
alias glogo='glog `git reflog | cut -c1-7`'

alias gpu='git push'
alias gpm='git pull'
alias gpr='git pull --rebase'
alias gprgp='gpr && gpu'

alias gru='git remote update'

alias gc='git commit'
alias goops='gc --amend'

function ghelp {
  echo '
    gs        git status

    gaa       git add -A
    ga        git add

    go        git checkout

    gd        git diff
    gdw       git diff --color-words

    gl        git log --graph --all --decorate
    glog      git log --graph --all --decorate --oneline
    glogo     git log --graph --all --decorate --oneline `git reflog | cut -c1-7`

    gpu       git push
    gpm       git pull
    gpr       git pull --rebase
    gprgp     gpr && gpu

    gru       git remote update

    gc        git commit && git status
    goops     git commit --amend && git status'
}

