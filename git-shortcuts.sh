alias gs='git status'
alias gaa='git add -A'
alias ga='git add'
alias go='git checkout'
alais gd='git diff'
alias gdw='git diff --color-words'
alias glog='git log --graph --oneline --all --decorate'
alias glogo='glog `git reflog | cut -c1-7`'

alias gup='git pull --rebase'
alias gupp='gup && git push'
alias gpu='git pull'

function gc {
  git commit
  gs
}

function goops {
  git commit --amend
  gs
}

function ghelp {
  echo '
    gs    git status
    gaa   git add -A
    ga    git add
    gdiff git diff --color-words
    glog  git log --graph --oneline --all --decorate
    gc    git commit && git status
    goops git commit --amend && git status'
}
