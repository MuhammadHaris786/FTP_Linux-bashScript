#!/bin/bash
sudo apt install -y vsftpd
listen=NO
sudo chown $USER:$USER /etc/vsftpd.conf
echo -e '/ananonymous_enable=NO/nlocal_enable=YES/nwrite_enable=YES/nlocal_umask=022/ndirmessage_enable=YES/nuse_localtime=YES/nxferlog_enable=YES/nconnect_from_port_20=YES/nchroot_local_user=YES/nsecure_chroot_dir=/var/run/vsftpd/empty/npam_service_name=vsftpd/nrsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem/nrsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key/nssl_enable=Yes/npasv_enable=Yes/npasv_min_port=10000/npasv_max_port=10100/nallow_writeable_chroot=YES/nssl_tlsv1=YES/nssl_sslv2=NO/nssl_sslv3=NO' >> /etc/vsftpd.conf
sudo ufw allow 20/tcp
sudo ufw allow 21/tcp
sudo systemctl enable vsftpd.service
sudo systemctl start vsftpd.service
ftp $(hostname -I)
