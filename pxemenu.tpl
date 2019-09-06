default menu.c32
prompt 0
timeout 30

MENU TITLE PXE Menu for {{hostname}} : {{mac}}

LABEL 1
MENU LABEL ^1) CentOS 7_X64 install
MENU DEFAULT
KERNEL /networkboot/vmlinuz
APPEND initrd=/networkboot/initrd.img inst.repo=ftp://192.168.0.101/pub ks=ftp://192.168.0.101/pub/{{hostname}}-{{mac}}.cfg

LABEL 2
MENU LABEL ^1) CentOS 7_X64 install + vnc
KERNEL /networkboot/vmlinuz
APPEND initrd=/networkboot/initrd.img inst.repo=ftp://192.168.0.101/pub ks=ftp://192.168.0.101/pub/{{hostname}}-{{mac}}.cfg inst.vnc

LABEL 3
MENU LABEL ^3) local boot
