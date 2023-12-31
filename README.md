
# mailserver installer 

## passed and tested distributions
 - ![](https://img.shields.io/badge/debian_9-stretch-green)
 - ![](https://img.shields.io/badge/debian_10-buster-green)
 - ![](https://img.shields.io/badge/debian_11-bullseye-green)
   
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

## check list
- check your resolv.conf
  - example 
    ```
    nameserver 8.8.4.4
    nameserver 1.1.1.1
    ```
- check your /etc/hosts
  make sure _hostname_ _-f_ or _hostnamectl_ _status_ points to your root DOMAIN name.
  
  hostnamectl status output should be like:
  ```
  # hostnamectl status
  
   Static hostname: mx1
   Transient hostname: mx1.emailbox.com.de
  ```
  >info: otherwise on sending mail to other mailservers which implemented dkim, would fail (see var/log/mail.log)

  ```
  127.0.0.1	localhost
  127.0.1.1	mx1
  <YOUR PUBLIC IP> emailbox.com.de imap.emailbox.com.de smtp.emailbox.com.de mail.emailbox.com.de
  ```
  >info: set your mailserver hostname: hostnamectl set-hostname mx1.emailbox.com.de OR hostname mx1.emailbox.com.de

  - reverse: for your vserver/decicated server add reverse dns on your  Host Proviver for your server
  in this example reserve should be:
  ```
  mx1.emailbox.com.de
  ```  
  - autodiscover for emailclients
  Add and point following default subdomains A Record for your mailserver
  ```
  imap.
  smtp.
  autodiscover.
  mail.
  ```
  >info: this is helpful for email clients like thunderbird (and other) to autodiscover while configure new email acount setup
  >
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

### testing with email client
- thunderbird autodiscover works fine if:
  - set DNS A records to your mailserver ip
    - imap, smtp, autodiscover 
- screenshots of test
  - [1 thunderbird emailclient](https://github.com/AysadKozanoglu/mailserver-postfix-dovecot-dkim-installer-debian-buster-bullseye/blob/main/emailClient_test_screenshots/thunderbird_autoconfig_test_success.png)
  - [1 thunderbird emailclient](https://github.com/AysadKozanoglu/mailserver-postfix-dovecot-dkim-installer-debian-buster-bullseye/blob/main/emailClient_test_screenshots/thunderbird_autoconfig_check_success.png)
### enjoy your mailserver
:wq!



### Thanks to
-  [Haisum Mussawir haisum](https://github.com/haisum)

### todo
- [ ] adding certbot to get ssl certificates for the domain and some default domains
- [ ] implementing rspamd spamfilter
- [x] restricting postfix Sender policy against telnet spoofing
- [x] check if current user running sciprt is root
- [x] check default params for mailserver is changed by sysAd
- [ ] maybe implementing spmahaus RBLS ( i have to think about)
- [ ] implementing DMARC with postfix Milter
- [x] implementing DKIM better way to postfix with Milter 
