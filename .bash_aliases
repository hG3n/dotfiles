# Alias Settings

# folders and files
alias uni="cd ~/Documents/Uni/"
alias site="cd ~/Documents/Uni/unisite/"

alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bash_profile"
alias bashaliases="vim ~/.bash_aliases "

# navigation
alias ..="cd .."
alias cdr="cd /"
alias ls1="ls -1"
alias lsl="ls -l "
alias ls-a="ls -A "

alias desk="cd ~/Desktop"
alias down="cd ~/Downloads"
alias docs="cd ~/Documents"
alias vol="cd /Volumes/"

# searching
alias findh="find ~ -name" # searches out of the ~ directory
alias finda="find / -name" # searches out of the main dir

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# program aliases
alias mvim="open -a MacVim"
alias ux="open -a UX"
alias pfopen="open -a Path\ Finder"
alias parallels="open /Applications/Parallels\ Desktop.app"

# programming and compiler
alias mc="make clean"
alias mcm="clear && clear && make clean && make"
alias g++11="LANG=en g++-4.7 -std=c++11"
alias gcc11="LANG=en gcc-4.7 -std=c++11"

# functionable settings
alias bat="(ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{printf("%.2f%%\n", $10/$5 * 100)}')"
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"
