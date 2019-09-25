default menu.c32
prompt 0
timeout 300

MENU TITLE PXE Menu for {{hostname}} : {{mac}}

LABEL 1
    MENU DEFAULT
    MENU LABEL ^1) CentOS 7_X64 install
    KERNEL /networkboot/vmlinuz
    APPEND initrd=/networkboot/initrd.img inst.repo=ftp://192.168.0.101/pub/centos7 ks=ftp://192.168.0.101/pub/{{hostname}}-{{mac}}.cfg

LABEL 2
    MENU LABEL ^1) CentOS 8_X64 install
    KERNEL /centos8/vmlinuz
    APPEND initrd=/centos8/initrd.img inst.repo=ftp://192.168.0.101/pub/centos8 ks=ftp://192.168.0.101/pub/{{hostname}}-{{mac}}.cfg

LABEL 3
    MENU LABEL ^2) CentOS 7_X64 install + vnc
    KERNEL /networkboot/vmlinuz
    APPEND initrd=/networkboot/initrd.img inst.repo=ftp://192.168.0.101/pub/centos7 ks=ftp://192.168.0.101/pub/{{hostname}}-{{mac}}.cfg inst.vnc

LABEL local
    MENU LABEL Boot local hard drive
    LOCALBOOT 0
