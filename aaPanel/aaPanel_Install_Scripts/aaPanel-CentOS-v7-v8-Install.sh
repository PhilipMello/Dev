#! /bin/bash
echo -e "==================================================by==Philip=Mello"
echo -e "=================================================================="
echo -e "\033[32maaPanel install script for CentOS 7 & 8\033[0m"
echo -e "=================================================================="
echo Type your hostname URL:
read hostnameurl
hostnamectl set-hostname $hostnameurl
echo "Your Hostname URL is:" $hostnameurl
yum update -y && yum upgrade -y
yum install -y epel-release
curl -o /etc/yum.repos.d/konimex-neofetch-epel-7.repo https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo
yum install -y wget curl htop neofetch nano vim
echo "(wget curl htop neofetch nano vim) has been installed"
yum remove -y epel-release
rm -rf /etc/yum.repos.d/konimex-neofetch-epel-7.repo
wget -O install.sh http://www.aapanel.com/script/install_6.0_en.sh && bash install.sh aapanel