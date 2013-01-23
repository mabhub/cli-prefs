alias gs='git status'
alias ts='tig status'

alias gaa='git add -A'
alias ga='git add'

alias go='git checkout'

alias gd='git diff'
alias gdw='git diff --color-words'

alias gl='git log --graph --decorate --all'
alias glog='git log --graph --oneline --all --decorate'
alias glogo='glog `git reflog | cut -c1-7`'
alias glago="git log --graph --all --decorate --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset'"

alias gpu='git push'
alias gp='git pull --ff-only'
alias gpl='git pull'
alias gpm='git pull'
alias gpr='git pull --rebase'
alias gprgp='gpr && gpu'

alias gru='git remote update'

alias gc='git commit'
alias goops='gc --amend'

alias gst='git stash'
alias gstp='git stash pop'

alias gstpr='gst && gpr && gstp'

# From https://coderwall.com/p/ok-iyg
# alias gprev='checkout HEAD^1'
# alias gnext="!sh -c 'git log --reverse --pretty=%H master | awk \"/$(git rev-parse HEAD)/{getline;print}\" | xargs git checkout'"

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
    glago     git log --graph --all --decorate --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset"

    gpu       git push
    gp        git pull --ff-only
    gpm       git pull
    gpl       git pull
    gpr       git pull --rebase
    gprgp     gpr && gpu

    gru       git remote update

    gc        git commit && git status
    goops     git commit --amend && git status

    gst       git stash
    gstp      git stash pop

    gstpr     git stash && git pull --rebase && git stash pop
  '
}

