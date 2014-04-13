#/usr/bin/env bash

set -e

CURRDIR=$(cd "$(dirname $0)" && pwd -P)

source "$CURRDIR/utils.sh"

add_ppa_if_missing "ppa:xubuntu-dev/xfce-4.10"

echo "Update apt index"
sudo apt-get update -y -qq

sudo apt-get install -y -qq \
  xfce4 \
  shimmer-themes \
  xfce4-power-manager \
  xfce4-power-manager-plugins \

# xfce4 package dependencies
#
#     desktop-base
#     exo-utils
#     gtk2-engines-xfce
#     orage
#     tango-icon-theme
#     thunar
#     thunar-data
#     thunar-volman
#     tumbler
#     tumbler-common
#     xfce-keyboard-shortcuts
#     xfce4
#     xfce4-appfinder
#     xfce4-mixer
#     xfce4-notifyd
#     xfce4-panel
#     xfce4-session
#     xfce4-settings
#     xfce4-volumed
#     xfconf
#     xfdesktop4
#     xfdesktop4-data
#     xfwm4
#     xscreensaver
#     xscreensaver-data

# plymouth-theme-xubuntu-logo
# plymouth-theme-xubuntu-text
# xfce4-goodies - (metapackage for the plugins) enhancements for the Xfce4 Desktop Environment

# abiword
# abiword-common
# abiword-plugin-grammar
# abiword-plugin-mathview
# aisleriot
# alacarte
# blueman
# brltty-x11
# catfish
# fonts-droid
# gigolo
# gimp
# gimp-data
# gmusicbrowser
# gnome-desktop-data
# gnome-games-data
# gnome-sudoku
# gnome-system-tools
# gnome-time-admin
# gnomine
# gnumeric
# gnumeric-common
# gnumeric-doc
# indicator-application-gtk2
# indicator-messages-gtk2
# indicator-sound-gtk2
# leafpad
# libabiword-2.9
# libaudio-scrobbler-perl
# libbabl-0.0-0
# libcolamd2.7.1
# libconfig-inifiles-perl
# libdigest-crc-perl
# libgdome2-0
# libgdome2-cpp-smart0c2a
# libgegl-0.0-0
# libgimp2.0
# libgoffice-0.8-8
# libgoffice-0.8-8-common
# libgsf-1-114
# libgsf-1-common
# libgstreamer-perl
# libgtk2-notify-perl
# libgtk2-trayicon-perl
# libgtkmathview0c2a
# libid3tag0
# libido-0.1-0
# liblink-grammar4
# libloudmouth1-0
# libnet-dbus-perl
# liboobs-1-5
# libotr2
# libots0
# libsexy2
# libtagc0
# libtidy-0.99-0
# libtie-ixhash-perl
# libwv-1.2-4
# libxfce4ui-utils
# libxfce4util4
# libxfcegui4-4
# libxml-twig-perl
# libxml-xpath-perl
# lightdm-gtk-greeter
# link-grammar-dictionaries-en
# linux-headers-3.2.0-58
# linux-headers-3.2.0-58-generic
# linux-headers-generic
# lp-solve
# mahjongg
# mpg321
# parole
# pavucontrol
# pidgin-microblog
# pidgin-otr
# plymouth-theme-xubuntu-logo
# plymouth-theme-xubuntu-text
# python-gmenu
# ristretto
# screensaver-default-images
# shimmer-themes
# system-tools-backends
# thunar-archive-plugin
# thunar-media-tags-plugin
# thunderbird
# transmission-common
# transmission-gtk
# ttf-droid
# ttf-lyx
# xchat
# xchat-common
# xfburn
# xfce4-cpugraph-plugin
# xfce4-datetime-plugin
# xfce4-dict
# xfce4-indicator-plugin
# xfce4-mailwatch-plugin
# xfce4-netload-plugin
# xfce4-notes
# xfce4-notes-plugin
# xfce4-places-plugin
# xfce4-power-manager
# xfce4-power-manager-data
# xfce4-quicklauncher-plugin
# xfce4-screenshooter
# xfce4-systemload-plugin
# xfce4-taskmanager
# xfce4-terminal
# xfce4-verve-plugin
# xfce4-weather-plugin
# xfce4-xkb-plugin
# xscreensaver-gl
# xubuntu-artwork
# xubuntu-default-settings
# xubuntu-desktop
# xubuntu-docs
# xubuntu-icon-theme
# xubuntu-wallpapers



# $ apt-cache search xfce
# network-manager-gnome - network management framework (GNOME frontend)
# shared-mime-info - FreeDesktop.org shared MIME database and spec
# alltray - Dock any program into the system tray
# cairo-dock-plug-ins-integration - Plug-ins for Cairo-Dock for a better integration in GNOME, KDE and Xfce
# cameramonitor - Webcam monitoring in system tray
# desktop-profiles - framework for setting up desktop profiles
# desktopnova-module-xfce - Xfce module for DesktopNova
# gamin - File and directory monitoring system
# glade-xfce - glade modules for xfce
# gtk2-engines-xfce - GTK+-2.0 theme engine for Xfce
# gwyddion - Scanning Probe Microscopy visualization and analysis tool
# gxmessage - an xmessage clone based on GTK+
# istanbul - Desktop session recorder producing Ogg Theora video
# kdocker - lets you dock any application into the system tray
# libexo-1-0 - Library with extensions for Xfce
# libexo-1-0-dbg - debugging informations for libexo
# libgarcon-1-0 - freedesktop.org compliant menu implementation for Xfce
# libthunar-vfs-1-2 - Legacy VFS abstraction used in Xfce
# libthunar-vfs-1-2-dbg - debugging informations for thunar-vfs
# libthunar-vfs-1-dev - Development files for thunar-vfs
# libxfce4ui-1-0 - widget library for Xfce
# libxfce4ui-1-dbg - debugging symbols for libxfce4ui
# libxfce4ui-1-dev - Development files for libxfce4ui
# libxfce4util-common - common files for libxfce4util
# libxfce4util4 - Utility functions library for Xfce4
# libxfce4util4-dbg - debugging informations for libxfce4util4
# libxfcegui4-4 - Basic GUI C functions for Xfce4
# libxfcegui4-4-dbg - debugging informations for libxfcegui4
# libxfcegui4-dev - Development files for libxfcegui4-4
# libxfconf-0-2 - Client library for Xfce4 configure interface
# libxfconf-0-2-dbg - debugging informations for libxfconf
# libxfconf-0-dev - Development files for libxfconf
# lxappearance - new feature-rich GTK+ theme switcher
# mail-notification - mail notification in system tray
# mail-notification-evolution - evolution support for mail notification
# orage - Calendar for Xfce Desktop Environment
# parole - media player based on GStreamer framework
# parole-dev - development files for Parole media player
# pekwm-themes - themes for the pekwm window manager
# qimo-session - Desktop environement for Kids
# ristretto - lightweight picture-viewer for the Xfce desktop environment
# screenlets - Widget-like mini-applications for GNOME
# shiki-colors-xfwm-theme - Xfwm/Xfce4 theme based on the Shiki-Colors Metacity theme
# squeeze - modern and advanced archive manager for Xfce
# thunar - File Manager for Xfce
# thunar-dbg - debugging informations for thunar
# uxlaunch - quick X and user desktop starter
# wally - Qt4 wallpaper changer
# wbar - light and fast launch bar
# wicd - wired and wireless network manager - metapackage
# wicd-gtk - wired and wireless network manager - GTK+ client
# xfburn - CD-burner application for Xfce Desktop Environment
# xfce-keyboard-shortcuts - xfce keyboard shortcuts configuration
# xfce4 - Meta-package for the Xfce Lightweight Desktop Environment
# xfce4-appfinder - Application finder for the Xfce4 Desktop Environment
# xfce4-artwork - additional artwork for the Xfce4 Desktop Environment
# xfce4-battery-plugin - battery monitor plugin for the Xfce4 panel
# xfce4-clipman - clipboard history utility
# xfce4-clipman-plugin - clipboard history plugin for Xfce panel
# xfce4-cpufreq-plugin - cpufreq information plugin for the Xfce4 panel
# xfce4-cpugraph-plugin - CPU load graph plugin for the Xfce4 panel
# xfce4-datetime-plugin - date and time plugin for the Xfce4 panel
# xfce4-dbg - meta-package for debugging symbols in Xfce
# xfce4-dev-tools - Script to help building Xfce from git
# xfce4-dict - Dictionary plugin for Xfce4 panel
# xfce4-diskperf-plugin - disk performance display plugin for the Xfce4 panel
# xfce4-eyes-plugin - eyes plugin for the Xfce4 panel
# xfce4-fsguard-plugin - filesystem monitor plugin for the Xfce4 panel
# xfce4-genmon-plugin - Generic Monitor for the Xfce4 panel
# xfce4-goodies - enhancements for the Xfce4 Desktop Environment
# xfce4-hdaps - plugin to indicate the status of HDAPS for the Xfce4 panel
# xfce4-indicator-plugin - plugin to display information from applications in the Xfce4 panel
# xfce4-linelight-plugin - Search plugin for Xfce panel
# xfce4-mailwatch-plugin - mail watcher plugin for the Xfce4 panel
# xfce4-messenger-plugin - Dbus messages plugin for xfce4-panel
# xfce4-mixer - Xfce mixer application
# xfce4-mount-plugin - mount plugin for the Xfce4 panel
# xfce4-mpc-plugin - Xfce panel plugin which serves as client for MPD music player
# xfce4-netload-plugin - network load monitor plugin for the Xfce4 panel
# xfce4-notes - Notes application for the Xfce4 desktop
# xfce4-notes-plugin - Notes plugin for the Xfce4 desktop
# xfce4-panel - panel for Xfce4 desktop environment
# xfce4-panel-dbg - debugging informations for xfce4-panel
# xfce4-panel-dev - Xfce4 panel development files
# xfce4-power-manager-data - power manager for Xfce desktop, arch-indep files
# xfce4-power-manager-plugins - power manager plugins for Xfce panel
# xfce4-radio-plugin - v4l radio control plugin for the Xfce4 panel
# xfce4-screenshooter - screenshots utility for Xfce
# xfce4-screenshooter-plugin - transitional dummy package for xfce4-screenshooter
# xfce4-sensors-plugin - hardware sensors plugin for the Xfce4 panel
# xfce4-session - Xfce4 Session Manager
# xfce4-session-dbg - Xfce4 Session Manager (debug symbols)
# xfce4-smartbookmark-plugin - search the web via the Xfce4 panel
# xfce4-systemload-plugin - system load monitor plugin for the Xfce4 panel
# xfce4-taskmanager - process manager for the Xfce4 Desktop Environment
# xfce4-terminal - Xfce terminal emulator
# xfce4-terminal-dbg - Xfce terminal emulator - debugging symbols
# xfce4-time-out-plugin - time out plugin for the Xfce4 panel
# xfce4-timer-plugin - timer plugin for Xfce panel
# xfce4-utils - Various tools for Xfce
# xfce4-verve-plugin - Verve (command line) plugin for Xfce panel
# xfce4-volumed - volume keys daemon
# xfce4-wmdock-plugin - Compatibility layer for running WindowMaker dockapps on Xfce
# xfce4-xkb-plugin - xkb layout switch plugin for the Xfce4 panel
# xfdesktop4 - xfce desktop background, icons and root menu manager
# xfdesktop4-data - xfce desktop background, icons and root menu (common files)
# xfdesktop4-dbg - debugging informations for xfdesktop4
# xfe - lightweight file manager for X11
# xfmpc - graphical GTK+ MPD client
# xfprint4 - Printer GUI for Xfce4
# xfswitch-plugin - fast user switching plugin for the Xfce panel
# xfwm4 - window manager of the Xfce project
# xfwm4-dbg - window manager of the Xfce project (debugging symbols)
# xfwm4-themes - Theme files for xfwm4
# libxfce4util-dev - Development files for libxfce4util6
# xfce4-weather-plugin - weather information plugin for the Xfce4 panel
# mousepad - simple Xfce oriented text editor
# xfce4-wavelan-plugin - wavelan status plugin for the Xfce4 panel
# xfce4-quicklauncher-plugin - rapid launcher plugin for the Xfce4 panel
# xfce4-places-plugin - quick access to folders, documents and removable media
# xfce4-cellmodem-plugin - cellular modem plugin for the Xfce4 panel
# exo-utils - Utility files for libexo
# xfconf - utilities for managing settings in Xfce
# xfce4-settings - graphical application for managing Xfce settings
# xfce4-power-manager - power manager for Xfce desktop
# xfce4-notifyd - simple, visually-appealing notification daemon for Xfce
# libxfce4util-bin - tools for libxfce4util
# libxfce4util6 - Utility functions library for Xfce4
# libxfce4util6-dbg - debugging informations for libxfce4util6
# gtk3-engines-xfce - GTK+-3.0 theme engine for Xfce
# libxfce4ui-utils - Utility files for libxfce4ui
# libxfce4ui-utils-dbg - debugging symbols for libxfce4ui-utils
# xfce4-whiskermenu-plugin - Alternate menu plugin for the Xfce desktop environment

# sudo apt-get remove --purge \
#   gnome-system-tools \
#   gnome-time-admin \
#   indicator-application-gtk2 \
#   indicator-messages-gtk2 \
#   indicator-sound-gtk2 \
#   lightdm-gtk-greeter \
#   link-grammar-dictionaries-en \
#   pavucontrol \
#   plymouth-theme-xubuntu-logo \
#   plymouth-theme-xubuntu-text \
#   screensaver-default-images \
#   shimmer-themes \
#   system-tools-backends \
#   ttf-droid \
#   ttf-lyx \
#   xfburn \
#   xfce4-dict \
#   xfce4-indicator-plugin \
#   xfce4-power-manager \
#   xfce4-power-manager-data \
#   xfce4-screenshooter \
#   xfce4-systemload-plugin \
#   xfce4-taskmanager \
#   xfce4-xkb-plugin \
#   xubuntu-artwork \
#   xubuntu-default-settings \
#   xubuntu-icon-theme \
#   xubuntu-wallpapers \
#   libgranite0 \
#   indicator-applet-appmenu \
#   firefox-globalmenu \
#   # appmenu-* \
#   # indicator-appmenu* \
