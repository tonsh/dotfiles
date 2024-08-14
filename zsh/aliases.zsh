# =========== Git Aliases  ===========
alias bi="brew install"
alias k="kubectl"
alias glog="git log"
alias gadd="git add"
alias gdev="git checkout dev"
alias gmaster="git checkout master"
alias ga="git commit --amend"
alias gcmt="git commit"
alias gpush="git push origin"
alias gpull="git pull --rebase origin"
alias gc="git checkout"
alias gst="git status"
alias gstash="git stash"
alias grebase="git rebase"
alias gr="git rebase"
# =========== End Git Aliases =========

# =========== Docker Aliases ===========
alias dc="docker-compose"
alias dcp="docker-compose ps"
alias dcp="docker-compose pull"
alias dcup="docker-compose up --force-recreate -d"
# peanut docker aliases
alias dredis="docker exec -it redis redis-cli"
alias dpeanut="docker exec -it peanut bash"
alias drunner="docker exec -it peanut-runner bash"
# =========== End Docker Aliases =======
