export PS1="\u:\W\ "

export PATH=/usr/local/git/bin:$PATH
export PATH=$PATH:"/Applications/VSCode-darwin-stable/Visual Studio Code.app/Contents/Resources/app/bin"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)


# Initialize identity for git commands
git config --global user.name "Armelle Dawson"
git config --global user.email "email address"

# Source .bashrc in order to pick up nvm set up
source ~/.bashrc
