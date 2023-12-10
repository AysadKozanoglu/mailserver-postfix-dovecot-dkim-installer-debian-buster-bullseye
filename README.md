
# mailserver installer 
#### distributions:
- Debian stretch 9
- Debian buster 10
- Debian bullseye 11

## postfix 
### preconfigured with mariadb as backend
## dovecot
### preconfigured with mariadb as backend
## DKIM
### dkim key generation for your DNS TXT record for dkim
#### wait the finished output of the full installation for the domain based DKIM TXT Record

automated shell installer script based on postfix dovecot DKIM support Debian buster 10

### overview
```
mailserver_installer
├── config
│   ├── dkim
│   │   └── config.source
│   ├── dovecot
│   │   └── config.source
│   ├── mailserver.config.source
│   ├── mariadbBootstrap
│   │   └── mariadbBootstrap.source
│   └── postfix
│       └── config.source
├── install
│   └── packages.source
├── install_postfix_dovecot_dkim.sh
└── snips_old
    ├── certbot.sh
    └── setup_dkim.sh
```

## Configure for your need and set variables
global config file for installer script
```
config/mailserver.config.source
```
> info: change this variables for your need before you start installation

## Installation
after you set your setting under mailserver.config.source above the installation will do everything for you automated
```
cd mailserver_installer
bash install_postfix_dovecot_dkim.sh
```
> info: installation take 4min (if you have a vps or vserver running with 2 core and 4 gb ram)

### notice
i disabled pop service (noone need it)

### enjoy your mailserver
:wq!


### Thanks to
-  [Haisum Mussawir haisum](https://github.com/haisum)

### todo
- adding certbot to get ssl certificates for the domain and some default domains like:
  - autodiscover
  - subdomain imap
  - subdomain smtp
  - subdomain webmail
- implementing rspamd spamfilter
- restricting postfix Sender policy against telnet spoofing
- maybe implementing spmahaus RBLS ( i have to think about)
