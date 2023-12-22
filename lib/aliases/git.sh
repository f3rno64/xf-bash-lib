#! /usr/bin/env bash

alias gb="git branch"
alias gbd="git branch -D"
alias gt="git tag"
alias gtd="git tag -D"
alias gcam="git commit -am"
alias gcm="git commit -m"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s%Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ga="git add -p"
alias gd="git diff"
alias gs="git status"
alias gfoa="git fetch --all --tags"
alias gst="git stash"
alias gstd="git stash drop"
alias grsoft="git reset --soft HEAD^"
alias grhard="git reset --hard HEAD^"
alias gpl='git pull origin $(git branch --show-current)'
