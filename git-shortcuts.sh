alias gs='git status'
alias gaa='git add -A'
alias ga='git add'
alias gdiff='git diff --color-words'
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
