#! /bin/bash
echo -e "==================================================by==Philip=Mello"
echo -e "=================================================================="
echo -e "\033[32mAtomy aaPanel install script for AlmaLinux 8.7 && 9.1\033[0m"
echo -e "=================================================================="
echo Type your hostname URL:
read hostnameurl
hostnamectl set-hostname $hostnameurl
echo "Your Hostname URL is:" $hostnameurl
dnf update -y && dnf upgrade -y
dnf install -y epel-release
curl -o /etc/dnf.repos.d/konimex-neofetch-epel-7.repo https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo
dnf install -y wget curl htop neofetch nano vim
echo "(wget curl htop neofetch nano vim) has been installed"
dnf remove -y epel-release
rm -rf /etc/dnf.repos.d/konimex-neofetch-epel-7.repo
wget -O install.sh http://www.aapanel.com/script/install_6.0_en.sh && bash install.sh aapanel