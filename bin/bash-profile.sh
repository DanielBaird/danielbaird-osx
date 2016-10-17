
# grab the .bashrc if there is one
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# bash completions via homebrew package "bash-completion"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    $(brew --prefix)/etc/bash_completion
fi

# git bash completion and prompt info
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true

# pull in colours
source ~/.config/danielbaird-osx/bin/bash-color-vars.sh

# set up the prompt
export PS1='\n${RED} ❤  ${GREY}\@  ${CYAN}\u  ${GREY}@  ${RED}\h  ${GREY}in  ${GREEN}\w ${RESTORE}$(__git_ps1)\n ️$ '

# add my path then homebrew's path to the start of path
export PATH="~/.config/danielbaird-osx/bin:/usr/local/bin:$PATH"

# terminal colouring
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

#   cdf:  cd's to whatever the frontmost Finder window is showing
cdf () {
    currFolderPath=$( /usr/bin/osascript <<EOT
        tell application "Finder"
            try
        set currFolder to (folder of the front window as alias)
            on error
        set currFolder to (path to desktop folder as alias)
            end try
            POSIX path of currFolder
        end tell
EOT
    )
    echo "cd to \"$currFolderPath\""
    cd "$currFolderPath"
}


alias cd..="cd .."
alias ll="ls -halpF"

alias openports="lsof -i | grep LISTEN"
alias clean-ds="find . -type f -name '*.DS_Store' -ls -delete"
alias wget-mirror='wget --no-parent --no-check-certificate --html-extension --convert-links --restrict-file-names=windows --recursive --level=inf --page-requisites -e robots=off --wait=0 --quota=inf'
