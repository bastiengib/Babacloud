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

Quand j'ai fait une installation de base en suivant [2] j'ai eu le soucis suivant: 

```
[init] Using Kubernetes version: v1.20.2
[preflight] Running pre-flight checks
        [WARNING IsDockerSystemdCheck]: detected "cgroupfs" as the Docker cgroup driver. The recommended driver is "systemd". Please follow the guide at https://kubernetes.io/docs/setup/cri/
[preflight] The system verification failed. Printing the output from the verification:
KERNEL_VERSION: 5.4.0-1026-raspi
CONFIG_NAMESPACES: enabled
CONFIG_NET_NS: enabled
CONFIG_PID_NS: enabled
CONFIG_IPC_NS: enabled
CONFIG_UTS_NS: enabled
CONFIG_CGROUPS: enabled
CONFIG_CGROUP_CPUACCT: enabled
CONFIG_CGROUP_DEVICE: enabled
CONFIG_CGROUP_FREEZER: enabled

net.ifnames=0 dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=LABEL=writable rootfstype=CONFIG_CGROUP_SCHED: enabled
CONFIG_CPUSETS: enabled
CONFIG_MEMCG: enabled
CONFIG_INET: enabled
CONFIG_EXT4_FS: enabled
CONFIG_PROC_FS: enabled
CONFIG_NETFILTER_XT_TARGET_REDIRECT: enabled (as module)
CONFIG_NETFILTER_XT_MATCH_COMMENT: enabled (as module)
CONFIG_OVERLAY_FS: enabled (as module)
CONFIG_AUFS_FS: enabled (as module)
CONFIG_BLK_DEV_DM: enabled
DOCKER_VERSION: 20.10.2
OS: Linux
CGROUPS_CPU: enabled
CGROUPS_CPUACCT: enabled
CGROUPS_CPUSET: enabled
CGROUPS_DEVICES: enabled
CGROUPS_FREEZER: enabled
CGROUPS_MEMORY: missing
CGROUPS_PIDS: enabled
CGROUPS_HUGETLB: missing
        [WARNING SystemVerification]: this Docker version is not on the list of validated versions: 20.10.2. Latest validated version: 19.03
        [WARNING SystemVerification]: missing optional cgroups: hugetlb
error execution phase preflight: [preflight] Some fatal errors occurred:
        [ERROR Mem]: the system RAM (908 MB) is less than the minimum 1700 MB
        [ERROR SystemVerification]: missing required cgroups: memory
[preflight] If you know what you are doing, you can make a check non-fatal with `--ignore-preflight-errors=...`
To see the stack trace of this error execute with --v=5 or higher
```

Du coup j'ai retouché la config de `/boot/firmware/cmdline.txt` sur baba-one et baba-two comme préconnisé dans [1] pour activer `cgroup_enable=memory`. Cgroup est un mécanisme d'isolation des resources pour linux [3].

[1] https://uthark.github.io/post/2020-09-02-installing-kubernetes-raspberrypi/
[2] https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
[3] https://fr.wikipedia.org/wiki/Cgroups
