#version=RHEL8
ignoredisk --only-use=sda
# Use graphical install
graphical
repo --name="AppStream" --baseurl=ftp://192.168.0.101/pub/centos8/AppStream
# Use network installation
url --url="ftp://192.168.0.101/pub/centos8/"
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=eno1 --ipv6=auto --activate
network  --bootproto=dhcp --device=eno2 --onboot=off --ipv6=auto
network  --bootproto=dhcp --device=enp1s0f0 --onboot=off --ipv6=auto
network  --bootproto=dhcp --device=enp1s0f1 --onboot=off --ipv6=auto
network  --hostname={{hostname}}
# Root password
rootpw --iscrypted $6$/6U8untKtQNyxYI5$71f1viEMWZVDO0i7wtT/fOZDZPSHpCtSvVQzfSiEo4RsfWLhUtv9XZ0ZejkvEY3LnKhu6XcXVOddAwtzULcML.
# Run the Setup Agent on first boot
firstboot --enable
# Do not configure the X Window System
skipx
# System services
services --enabled="chronyd"
# System timezone
timezone America/Los_Angeles --isUtc

%packages
@^minimal-environment
kexec-tools

%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end

%post --nochroot
echo "UseDNS yes" >> /etc/ssh/sshd_config
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAv4z5uSSJBLqh1fJ8B/KiYr8gc4DlpVOX34hLPs1L907VK6jjL43g0NpYHGzCTZksoqC8RA+HLkVxIW0A2oI86usvOLE61Yr52fs9GWRmHxEx36iAcqueC7UIgK846CcMSZGhinUnc6OF1+gQnlTUx2mQ9yaa59yT4se9RC+IC48= root@elcapitan3.ucmerced.edu" /root/.ssh/authorized_keys


%end
