# .bashrc

# Open and source .basrc for a given directory.
alias sb="source .bashrc"
alias brc="vi .bashrc; sb"

# Aliases to common directories
alias onolog="cd ~/Sites/Onolog && sb"
alias plp="cd ~/Sites/Summit/traject && sb"
alias toa="cd ~/Sites/Summit/plp-etl-node && sb"
alias typeahead="cd ~/Sites/react-bootstrap-typeahead && sb"

# Default editor
# Tip: make sure you 'export' your variables in order to have them show in env
export SVN_EDITOR=vim
export EDITOR=vim
export VISUAL=vim

# git
alias g="git"
alias ga="git add"
alias gb="git branch"
alias gbl="git branch --list"
alias name="git symbolic-ref HEAD 2>/dev/null --short" # Get the current branch name
alias gc="git commit"
alias amend="git commit --amend"
alias aamend="git commit -a --amend"
alias co="git checkout"
alias gd="git diff"
alias gr="git reset"
alias reset="git reset"
alias hard="git reset --hard" # completely get rid of one or more commits
alias gs="git status"
alias show="git show"
alias sno="git show --name-only"
alias stash="git stash"
alias apply="git stash apply"
alias list="git stash list"
alias undo="git reset HEAD@{1} --soft" # Undo the last action
alias h="HEAD"
alias grh="git reset HEAD"

# Rebasing
alias r="git rebase"
alias rebase="git fetch && r master" # This will update the tree and play your commits over it
alias r5="r -i HEAD~5"
alias r10="r -i HEAD~10"
alias ri="r -i master"
alias rc="r --continue"
alias cont="r --continue"

alias land="merge_and_delete_branch"
alias pull="git pull origin master" # This will merge master into any current commits
alias ship="git push origin master"
alias ol="git log --pretty=oneline --decorate"
alias oldates="git log --pretty=format:'%h %ai %an %s'"
alias mine="git log --author=egiovanola --date=short --pretty=format:'%h %ad %s'"
alias exportmine="git log --author=egiovanola --date=short --pretty=format:'%h,%ad,%s' > git-log.csv"

# Add git branch to prompt
function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Merge the current branch into master and delete it
function merge_and_delete_branch {
  local BRANCH=`name`

  echo "Checking out \"master\"..."
  co master

  echo "Merging branch \"${BRANCH}\" into master..."
  git merge $BRANCH

  # Delete the branch
  echo "Cleaning up branch \"${BRANCH}\"..."
  gb -D $BRANCH
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  case $TERM in
  xterm*)
  TITLEBAR='\[\033]0;\u@\h:\w\007\]'
  ;;
  *)
  TITLEBAR=""
  ;;
  esac

PS1="${TITLEBAR}\
$GREEN[$GREEN\u@\h:\w$LIGHT_GRAY\$(parse_git_branch)$GREEN]\
$GREEN\$ "
PS2='> '
PS4='+ '
}
proml

