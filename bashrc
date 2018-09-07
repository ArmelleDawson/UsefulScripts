

#-------------------------------------------------------------
# Greeting, motd etc. ...
#-------------------------------------------------------------

# Color definitions (taken from Color Bash Prompt HowTo).
# Some colors might look different of some terminals.
# For example, I see 'Bold Red' as 'orange' on my screen,
# hence the 'Green' 'BRed' 'Red' sequence I often use in my prompt.


# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset

# Git branch in prompt.
#parse_git_branch() {
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}


#export PS1="\e[33;1m\u: \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "



# Git status bash prompt
#
# In addition to printing the current working directory, this prompt will 
# show a number of things if you are in a git repository:
# - The current branch you are in
# - Whether there are untracked files in the repository (there will be an 
#   asterisk after the branch nome if there are)
# - Whether there are any unmerged/unstaged/staged changes or if the directory
#   is clean. See below for the colors that will be used, and change them if 
#   you'd like.

# Storing these color codes for later use
txtblk='\033[0;30m' # Black - Regular
txtred='\033[0;31m' # Red
txtgrn='\033[0;32m' # Green
txtylw='\033[0;33m' # Yellow
txtblu='\033[0;34m' # Blue
txtpur='\033[0;35m' # Purple
txtcyn='\033[0;36m' # Cyan
bldblk='\033[1;30m' # Black - Bold
bldred='\033[1;31m' # Red
bldgrn='\033[1;32m' # Green
bldylw='\033[1;33m' # Yellow
bldblu='\033[1;34m' # Blue
bldpur='\033[1;35m' # Purple
bldcyn='\033[1;36m' # Cyan

# Set color for the directory listing in the prompt
dir_listing_color=$txtpur

# Set colors for different repository states
unmerged_color=$bldpur
unstaged_color=$bldred
staged_color=$bldcyn
clean_color=$bldgrn

function git_color {
  git_status=`git status 2> /dev/null`
  
  if [ -n "`echo $git_status | grep "# Unmerged paths:"`" ]; then
    echo -e $unmerged_color
  elif [ -n "`echo $git_status | grep "# Changes not staged for commit:"`" ]; then
    echo -e $unstaged_color
  elif [ -n "`echo $git_status | grep "# Changes to be committed:"`" ]; then
    echo -e $staged_color
  else
    echo -e $clean_color
  fi
}

function git_branch {
  git_branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
 
  if [ -n  "`git status 2> /dev/null | grep "# Untracked files:"`" ]; then
    untracked="*"
  fi
  if [ "`expr "$git_branch" : '.*'`" -gt "0" ]; then 
    echo " "'['$git_branch$untracked']'
  fi
}

PS1='\e[33;1m\u: `echo -e $dir_listing_color`\]\w\[`git_color`\]`git_branch`\[\e[0m\]$ '
PS2="> "

# Environment variable definition

export JAVA_HOME=$(/usr/libexec/java_home)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
