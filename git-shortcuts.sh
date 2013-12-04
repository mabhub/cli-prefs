alias gs='git status'
alias ts='tig status'

alias gaa='git add -A'
alias ga='git add'
alias gap='git add -p'

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

alias gb='git branch'
alias gm='git merge'
alias gr='git rebase'

alias grh='git reset HEAD'
alias grH='git reset --hard HEAD'

alias gc='git commit'
alias goops='gc --amend'

alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'


alias gstpr='gst && gpr && gstp'
alias grl='gru && gl'

alias gf='git diff --numstat'

# Désactivé car provoque des erreurs avec Cygwin :
# From https://coderwall.com/p/ok-iyg
# alias gprev='checkout HEAD^1'
# alias gnext="!sh -c 'git log --reverse --pretty=%H master | awk \"/$(git rev-parse HEAD)/{getline;print}\" | xargs git checkout'"

function ghelp {
  cat << EOF
    gs        git status
    ts        tig status

    gaa       git add -A
    ga        git add
    gap       git add -p

    go        git checkout

    gd        git diff
    gdw       git diff --color-words

    gl        git log --graph --decorate --all
    glog      git log --graph --oneline --all --decorate
    glogo     glog \`git reflog | cut -c1-7\`
    glago     git log --graph --all --decorate --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset'

    gpu       git push
    gp        git pull --ff-only
    gpl       git pull
    gpm       git pull
    gpr       git pull --rebase
    gprgp     gpr && gpu

    gru       git remote update

    gb        git branch
    gm        git merge
    gr        git rebase

    grh       git reset HEAD
    grH       git reset --hard HEAD

    gc        git commit
    goops     gc --amend

    gst       git stash
    gstp      git stash pop
    gstl      git stash list


    gstpr     gst && gpr && gstp
    grl       gru && gl

    gf        git diff --numstat
EOF
}

