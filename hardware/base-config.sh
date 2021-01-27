apt-get update
apt-get upgrade

# microk8s
echo -e "cgroup_enable=memory cgroup_memory=1 $(cat /boot/firmware/cmdline.txt)" > /boot/firmware/cmdline.txt
snap install microk8s --classic --channel=1.18/stable

microk8s enable rbac
microk8s enable dashboard