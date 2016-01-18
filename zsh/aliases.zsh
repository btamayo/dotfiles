# Global aliases only works with ZSH
if [[ "$0" =~ 'zsh' ]]; then
	# Global directories aliases
	alias -g ..='..'
	alias -g ...='../..'
	alias -g ....='../../..'
	alias -g .....='../../../..'
	alias -g ......='../../../../..'
	alias -g .......='../../../../../..'

	# Global commands aliases
	alias -g G='| grep'
	alias -g N='| grep -v'
	alias -g C='| wc -l'
	alias -g S='| sort'
	alias -g H='| head'
	alias -g L="| less"
	alias -g T='| tail'
	alias -g C='| pygmentize -O style=monokai -f console256 -g'
else
	# Directories aliases
	alias ..='cd ..'
	alias ...='cd ../..'
	alias ....='cd ../../..'
	alias .....='cd ../../../..'
	alias ......='cd ../../../../..'
	alias .......='cd ../../../../../..'
fi

# Aliases only for non root users
if [[ $UID != 0 || $EUID != 0 ]]; then
	alias sudo='sudo ' # Allow aliases to be sudo’ed
	alias halt='sudo shutdown -h now'
	alias reboot='sudo shutdown -r now'
	alias apt='sudo apt-get'
	alias aptinstall='sudo apt-get install'
	alias aptremove='sudo apt-get remove'
	alias aptupdate='sudo apt-get update'
	alias aptupgrade='sudo apt-get upgrade'
	alias aptsearch='sudo apt-cache search'
	alias aptall='sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove'
else
	alias halt='shutdown -h now'
	alias reboot='shutdown -r now'
	alias apt='apt-get'
	alias aptinstall='apt-get install'
	alias aptremove='apt-get remove'
	alias aptupdate='apt-get update'
	alias aptupgrade='apt-get upgrade'
	alias aptsearch='apt-cache search'
	alias aptall='apt-get update && apt-get upgrade && apt-get autoremove'
fi

# Directories working
alias pwd=' pwd'
alias cd=' cd'
alias cdg=' cd "$(git rev-parse --show-toplevel)"' ## git root
alias -- -=' cd -'
alias 1=' cd -'
alias 2=' cd -2'
alias 3=' cd -3'
alias 4=' cd -4'
alias 5=' cd -5'
alias 6=' cd -6'
alias 7=' cd -7'
alias 8=' cd -8'
alias 9=' cd -9'
alias ls='ls --color=auto'
alias l='ls -lh --group-directories-first'
alias ll='ls -lhA --group-directories-first'
alias llm='ls -lhAt --group-directories-first' ## "m" for sort by last modified date
alias llc='ls -lhAU --group-directories-first' ## "c" for sort by creation date
alias lls='ls -lhAS --group-directories-first' ## "s" for sort by size
alias k='k -h'
alias kl='k -h --no-vcs'
alias kk='k -Ah'
alias kkl='k -h --no-vcs'

# 1 letter commands shortcuts
alias c=" clear && printf '\033[3J'"
alias p=' dirs -v | head -10' ## most used dirs for current session
alias x=' exit'
alias d='desk'
alias h='history'
alias j='jobs'
alias v='vim'
alias e='vim'
alias n='nano'
alias g='git'
alias m='mutt'

# Others commands shortcuts
alias dg='desk go'
alias co='pygmentize -O style=monokai -f console256 -g'
alias mf='mutt -F'
alias ps='ps auxf'
alias df='df -h'
alias du='du -h'
alias du0='du --max-depth=0'
alias du1='du --max-depth=1 | sort -k2' # sort by name
alias du1s='du --max-depth=1 | sort -h' # sort by size
alias rd='rmdir'
alias md='mkdir -p'
alias mcd='mkdir-cd'
alias mkcd='mkdir-cd'
alias rmf="rm -rf"
alias rmrf="rm -rf"
alias bak='backup-file'
alias tailf='tail -f'
alias less='less -r'
alias free='free -m'
alias whence='type -a'
alias whereis='whereis'
alias grep='grep --color=auto'
alias vgrep='grep -v --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias zshrc='source ~/.zshrc' ## Reload config

# Find things...
alias f='grep -rinw "." -e ' ## inside files
alias ack='ack -Hir' ## inside files advanced
alias ff='find . -type f -iname ' ## insensitive filename
alias fn='glob-find-files-by-name' ## insensitive filename with zsh globbing
alias fr='find-and-replace' ## find and replace in current dir

# Git
alias gs='git status'
alias ga='git add'
alias gss='git status-short'
alias gl='git log'
alias gll='git pretty-log'
alias gls='git pretty-log-short'
alias glll='git pretty-log-nomerges'
alias gd='git diff'
alias gc='git commit'
alias gb='git branch'
alias gt='git tag'
alias gca='git commit -a'
alias gco='git checkout'
alias gpull='git pull'
alias gpullo='git pull origin master'
alias gpush='git push'
alias gpusho='git push origin master'
alias gss='git stash save'
alias gsa='git stash apply'
alias gsp='git stash pop'
alias gsl='git stash list'

# Local rsync
alias rsync-copy="rsync -av --progress -h"
alias rsync-move="rsync -av --progress -h --remove-source-files"
alias rsync-update="rsync -avu --progress -h"
alias rsync-synchronize="rsync -avu --delete --progress -h"

# Files rights
alias 600='chmod 600 -R'
alias 640='chmod 640 -R'
alias 644='chmod 644 -R'
alias 755='chmod 755 -R'
alias 775='chmod 775 -R'
alias 777='chmod 777 -R'
alias www="chown www-data:www-data * .* -R"

# Date & time helpers
alias cal='cal -3'
alias week='date +%V'
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Network & ISP tests
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias myips="ifconfig -a | grep -o 'inet6\? \(ad\?dr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:|adr:)? ?/, \"\"); print }' | grep -v '127.0.0.1' | grep -v '::1'"
alias localip="ifconfig | grep -Eo 'inet (addr:|adr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias ipstats="netstat -ntu | tail -n +3 | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n"
alias ns="nslookup"

# Curl & web helpers
alias dl='curl --continue-at - --location --progress-bar --remote-name --remote-time' # Download remote file
alias wget-site='wget --mirror -p --convert-links -P'
alias header='curl-header'
alias purge='curl-purge'

# Online pastebins
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias clbin="curl -F 'clbin=<-' https://clbin.com"

# Because Oo
alias tableflip="echo '(ノಠ益ಠ)ノ彡┻━┻'" # see https://gist.github.com/endolith/157796
alias utf8test="wget -qO- http://8n1.org/utf8"

# Record x11
alias record="ffmpeg -f x11grab -s 1366x768 -an -r 16 -loglevel quiet -i :0.0 -b:v 5M -y" ## then pass a filename

# Laravel helpers
alias art='php artisan'
alias mig-install='php artisan migrate:install'
alias mig-seed='php artisan migrate:refresh --seed'