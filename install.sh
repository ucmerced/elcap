cp -v pxelinux.cfg/* /tftpboot/pxelinux.cfg
mkdir -p /var/ftp/pub/centos7
mkdir -p /var/ftp/pub/centos8
cp -v centos7/* /var/ftp/pub/centos7
cp -v centos8/* /var/ftp/pub/centos8
