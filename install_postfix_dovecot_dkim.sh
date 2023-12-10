#!/usr/bin/env bash
#
# postfix dovecot installer with dkim support
#
# Copyright 2023 Aysad Kozanoglu
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


#####
# Script to install postfix dovecot DKIM
#####

## check if config is customized


exit 0
# including config file
source config/mailserver.config.source

# check if config vars is customized to individual needs
config/check.source

export DEBIAN_FRONTEND=noninteractive

# including and installing needed packages
source install/packages.source

# including database bootstrapping  creating database and tables
source config/mariadbBootstrap/mariadbBootstrap.source

# including configure postfix
source config/postfix/config.source

# including configure Dovecot
source config/dovecot/config.source

# including configure dkim 
source config/dkim/config.source

mainInstaller(){
  installPackages
  bootstrapdb
  postfixConfig
  dovecotConfig
  dkimConfig
}

mainInstaller
