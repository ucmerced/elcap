default menu.c32
prompt 0
timeout 30
MENU TITLE PXE Menu for {{hostname}} : {{mac}}
LABEL centos7_x64 install
MENU LABEL CentOS 7_X64 install
KERNEL /networkboot/vmlinuz
APPEND initrd=/networkboot/initrd.img inst.repo=ftp://192.168.0.101/pub ks=ftp://192.168.0.101/pub/{{hostname}}-{{mac}}.cfg
