# ==============
# === Public ===
# ==============

dbrecr='bin/rake db:recreate > /dev/null ; bin/rake db:seed ; bin/rake db:test:prepare'

# List with numeric permissions
alias d='stat -c "%A (%a) %8s %.19y %n"'

# `utcnow` is defined in its own alias
alias myvimbundle='tar cfz ~/Desktop/vim-bundle-`utcnow`.tar.gz -C ~/.vim/bundle/ .'

# Run nload with custom options:
# - set the scale to 55000 Kbit/s
# - refresh every 250ms
# - set the units for both traffic and total data to MB
alias mynload='nload -i 55000 -o 55000 -t 250 -u M -U M'

alias g='git'
alias mychrome='google-chrome --user-data-dir=$HOME/.config/google-chrome/vnc-pairing-profile/ &'
alias myvpn='sudo openvpn --config /etc/openvpn/client.conf'
alias utcnow='date -u -d "today" +"%Y%m%dT%H%M%SZ"'
alias myvncserver='vncserver -geometry 1280x900'
alias myvncviewer='vncviewer localhost:1'
alias myvnckill='vncserver -kill :1'

alias myips="ifconfig | grep 'inet ' -B1"
# http://unix.stackexchange.com/questions/22615/how-can-i-get-my-external-ip-address-in-bash/81699#81699
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com | xclip -filter'

# http://stackoverflow.com/questions/17236796/how-to-remove-old-docker-io-containers/18141323#18141323
alias dkclear='docker rm `docker ps --no-trunc -a -q`'
alias dk='docker'

alias dbreset="bin/rake db:drop db:create db:migrate; bin/rake db:seed; bin/rake db:test:prepare"

# Keyboard layout
#
# useful info
# http://askubuntu.com/questions/29603/how-do-i-clear-xmodmap-settings
# https://wiki.kubuntu.org/X/InputConfiguration#Keyboard_layout
# http://superuser.com/questions/421227/how-do-i-configure-keyboard-layouts-in-ubuntu-12-04
# http://askubuntu.com/questions/29731/rebind-alt-key-to-win-using-setxkbmap
#
# In summary
# - the configuration is done with the modern tool setxkbmap (at /usr/bin/setxkbmap)
# - /etc/X11/xorg.conf is considered obsolete, but still honoured if present
# - /etc/default/keyboard => contains what was in the keyboard section of xorg.conf
# - /etc/default/console-setup => tells which keyboard conf file is loaded
# - /usr/share/X11/xkb/rules/evdev.lst => contains all the options accepted by setxkbmap
# with this in mind:
# swap left win / left alt on the apple external keyboard
# reset default left win / left alt on a normal win keyboard
alias  kbnb="/usr/bin/setxkbmap -model pc105 -layout gb -option '' -option ctrl:nocaps"
# alias kbmac="/usr/bin/setxkbmap -model pc105 -layout gb -option '' -option ctrl:nocaps -option altwin:swap_lalt_lwin"
alias kbmac="kbnb -option altwin:swap_lalt_lwin"

alias cdvim='cd $HOME/.vim/bundle/bouncing-vim/'
alias cdpub='cd $HOME/Dropbox/dotfiles-public/'
alias cddot='cd $HOME/Dropbox/dotfiles/'
alias cdscr='cd $HOME/Dropbox/scripts/'

# alias lsdir="ls -lA | grep ^d | sed -r 's/.+[[:digit:]]{2}:[[:digit:]]{2}\s*(.+)/\1/g'"
alias lsdir="find * -maxdepth 0 -type d"
# alias lsfiles="ls -lA | grep -v ^d | sed -r 's/.+[[:digit:]]{2}:[[:digit:]]{2}\s*(.+)/\1/g'"
alias lsfiles="find * -maxdepth 0 -type f"
alias pullallmaster="find * -maxdepth 0 -type d | while read repo; do echo \"---- \$repo ----\"; cd \$repo; git pull origin master; cd ..; echo; done"
# alias pullall="ls -lA | grep ^d | sed -r 's/.+[[:digit:]]{2}:[[:digit:]]{2}\s*(.+)/\1/g' | while read repo; do echo \$repo; cd \$repo; git pull; cd ..; done"

alias colorref='for x in 0 1 4 5 7 8; do for i in `seq 30 37`; do for a in `seq 40 47`; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo "";'

# alias libreoffice='libreoffice4.2'

alias nrun='sudo nginx'
alias nreload='sudo nginx -s reload'
alias nstop='sudo nginx -s stop'
alias nconf='subl ~/Dropbox/dotfiles/opt/nginx/conf/nginx.conf &'

alias pgstart='sudo service postgresql start'
# alias pgconnect='psql -U postgres -h localhost'
alias pgconnect='sudo -iu postgres psql'

alias be='bundle exec'

alias gitg='gitg &'

alias git-add-non-white='git diff -w --no-color | git apply --cached'

alias jsc='node'

alias trash='trash-put'

alias google-chrome-dev="google-chrome --user-data-dir=$HOME/.config/google-chrome-dev --disable-accelerated-compositing"

alias rbr='rbenv rehash'

# <http://stackoverflow.com/questions/4725291/shell-function-alias-for-rails-console-server-etc-to-work-with-rails-2-3>
alias railsc="if [ -f script/console ]; then script/console; else script/rails console; fi"
alias railss="if [ -f script/server ]; then script/server; else script/rails server; fi"

alias largest_file='ruby -e "puts Dir[Dir.pwd + \"/**/*\"].max_by{ |path| File.file?(path) && File.size?(path) || 0 }"'

alias myaliases='vim ~/.bash_aliases'
alias all-services='sudo initctl list'

# SYSTEM

# http://askubuntu.com/a/254585
alias remove-old-kernels="dpkg --list | grep -E 'linux-(image|headers)-[[:digit:]]' | awk '{ print $2 }' | sort | grep -v $(uname -r | perl -pe 's/(\d.+\d).+/\1/') | xargs sudo apt-get purge -y"

# alias cpugov="cpufreq-info | grep \"The governor\" | sed -E 's/.+The governor \"(.+)\".+/\1/' | tail -n 1"
alias cpugov="cpufreq-info | grep \"The governor\" | sed -E 's/.+The governor \"(.+)\".+/\1/'"
alias cpuperf='cpugov && sudo cpufreq-set -g performance -c 0 -r && sudo cpufreq-set -g performance -c 1 -r && cpugov'

alias vboxversion="vboxheadless --version | tail -n 1 | sed -r 's/(.+)r.+/\1/'"
alias hdactivity="watch --interval 1 iostat -d /dev/sda"
alias ramactivity="watch -n 1 free"
alias raminfo="sudo dmidecode --type 17"

# Parallels utils

alias archive-resources="tar -cvf /media/psf/Home/Desktop/ubuntu-stuff/ubuntu-resources.tar ~/Dropbox/dotfiles ~/Dropbox/notes ~/downloads"
alias archive-precise-debs="tar -cvf /media/psf/Home/Desktop/ubuntu-stuff/precise-debs.tar /var/cache/apt/archives/*.deb"
