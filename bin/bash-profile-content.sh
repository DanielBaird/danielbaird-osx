# set -euo pipefail
# IFS=$'\n\t'

# grab the .bashrc if there is one
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# bash completions via homebrew package "bash-completion"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    $(brew --prefix)/etc/bash_completion
fi

# bash history tweaks

# append to history file
shopt -s histappend
# ignore repeated commands
HISTCONTROL=ignoredups
# always ignore boring stuff like ls
HISTIGNORE='ls:ll:pwd:git status:fg:bg:history'


# git bash completion and prompt info
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true

# pull in colours
source ~/.config/danielbaird-osx/bin/bash-color-vars.sh

# set up the prompt
export PS1="\n╭  ${RED}♥ ${GREY}\@ ${CYAN}\u${GREY} @ ${RED}\h ${GREY}in ${GREEN}\w ${RESTORE}\$(__git_ps1)\n╰  $ "

# add my path then homebrew's path to the start of path
export PATH="$HOME/.config/danielbaird-osx/bin:/usr/local/bin:$PATH"

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

# switch on directory-based environment management
# this needs to be after stuff that affects the command prompt like git-prompt
eval "$(direnv hook bash)"
echo "direnv is enabled; run  direnv allow <dir>  to enable for <dir>."

# lazy cd-up-one
alias cd..="cd .."

# better ls
alias ll="ls -halpF"

# grep recursively through subdirs
alias grepr="grep -r"

# what servers are running
alias openports="lsof -i | grep LISTEN"

# remove .DS_Store files from here down
alias clean-ds="find . -type f -name '*.DS_Store' -ls -delete"

# fetch a whole website
alias wget-mirror='wget --no-parent --no-check-certificate --html-extension --convert-links --restrict-file-names=windows --recursive --level=inf --page-requisites -e robots=off --wait=0 --quota=inf'

# terse list of git commits
alias gitlog="git log --oneline -16"

# what aliases are defined in my ssh config
alias sshaliases="grep -w -i 'Host' ~/.ssh/config | sed 's/Host //' | grep -v '\*' "

# use title NewTitle to set a new title for your terminal tab
function title() {
    echo -n -e "\033]0;$1\007"
}

# grep through ~/.ssh/config and list the host aliases
alias catssh="cat ~/.ssh/config | grep '^Host ' | awk '{print $2}' | tr '\r' '\n'"




