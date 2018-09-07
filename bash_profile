export PS1="\u:\W\ "

export PATH=/usr/local/git/bin:$PATH
export PATH=$PATH:"/Applications/VSCode-darwin-stable/Visual Studio Code.app/Contents/Resources/app/bin"

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export GRADLE_HOME=/Library/Gradle/Home
export PATH=$PATH:/Library/PostgreSql/9.5/bin
export PATH=$PATH:$GRADLE_HOME/bin
export APACHE_HOME=/usr/local/Cellar/tomcat/9.0.5/libexec
export CATALINA_HOME=/usr/local/Cellar/tomcat/9.0.5/libexec
export VAGRANT_CLOUD_TOKEN=Yh5UrJ05X4McYg.atlasv1.kWnT7s8nyJW4yQtH3U7aRxTzqxEd4rQQjsXUtf6lIdxTFuf9PTevzbCpFUEsPLOUoT4
export CLASSPATH=/Users/adawson/Dev/test

# Initialize identity for git commands
git config --global user.name "Armelle Dawson"
git config --global user.email "adawson@quickbase.com"

# Source .bashrc in order to pick up nvm set up
source ~/.bashrc
