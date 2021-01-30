# MCO Machines

Maintiens des machines en conditions opérationelle. On assume que les machines sont des ubuntu 20.04+.

Mise à jour des paquets. 
```shell
sudo apt update 
sudo apt upgrade
```

## Docker installation

https://docs.docker.com/engine/install/ubuntu/


A la fin de l'installation ajouter l'utilisateur au groupe docker pour l'utiliser sans privilèges root.

```shell
sudo gpasswd -a $USER docker
```


## Kubectl / Kubelet / Kubeadm

https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
