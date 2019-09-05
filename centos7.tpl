#version=DEVEL
# System authorization information
auth useshadow passalgo=sha512
# Install OS instead of upgrade
install
# Use network installation
url --url="ftp://192.168.0.101/pub/"
# Use graphical install
graphical
selinux disabled
bootloader location=mbr
clearpart --all --initlabel
# Firewall configuration
firewall --disabled
ignoredisk --only-use=sda
# Keyboard layouts
# old format: keyboard us
# new format:
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8
# Installation logging level
logging --level=info
# Network information
network  --bootproto=dhcp --device=em1 --ipv6=auto --activate
network  --bootproto=dhcp --device=em2 --onboot=off --ipv6=auto
network  --bootproto=dhcp --device=p1p1 --onboot=off --ipv6=auto
network  --bootproto=dhcp --device=p1p2 --onboot=off --ipv6=auto
network  --hostname={{hostname}}

# Root password
rootpw --iscrypted $1$XH39Ctnk$1ooCLPeW2nyBi6kJhEuy7.
# System services
services --enabled="chronyd"
# System timezone
timezone America/Los_Angeles
# System bootloader configuration
bootloader --location=mbr --boot-drive=sda
# Partition clearing information
clearpart --all --initlabel --drives=sda
# Disk partitioning information
part /boot --fstype="xfs" --ondisk=sda --size=300
part swap --asprimary --fstype="swap" --ondisk=sda --size=1024
part pv.115 --fstype="lvmpv" --size=952544
volgroup root_vg01 --pesize=4096 pv.115
logvol /  --fstype="xfs" --size=542932 --name=lv_01 --vgname=root_vg01

%packages
@^minimal
@core
chrony

%end

%addon com_redhat_kdump --disable --reserve-mb='auto'

%end
