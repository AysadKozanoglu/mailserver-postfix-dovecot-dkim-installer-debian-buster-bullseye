# mailserver installer 
## postfix 
## dovecot
## DKIM

automated shell installer script based on postfix dovecot DKIM support Debian buster 10

### overview
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
