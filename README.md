# mobileum_cna_may162022

## Session Plan :-  

<img src="plan.png">

### Understanding docker client and docker host 

### context concept in Docker client side

```
docker context  ls
NAME        DESCRIPTION                               DOCKER ENDPOINT               KUBERNETES ENDPOINT   ORCHESTRATOR
default *   Current DOCKER_HOST based configuration   unix:///var/run/docker.sock                         swarm
root@docker-client:~# 
root@docker-client:~# 
root@docker-client:~# docker context  create  docker-host1  --docker   host="ssh://ashu@172.31.31.222"
docker-host1
Successfully created context "docker-host1"
root@docker-client:~# 
root@docker-client:~# 
root@docker-client:~# 
root@docker-client:~# docker context  ls
NAME           DESCRIPTION                               DOCKER ENDPOINT               KUBERNETES ENDPOINT   ORCHESTRATOR
default *      Current DOCKER_HOST based configuration   unix:///var/run/docker.sock                         swarm
docker-host1                                             ssh://ashu@172.31.31.222                            
root@docker-client:~# 
root@docker-client:~# 
root@docker-client:~# docker  context use  docker-host1
docker-host1
Current context is now "docker-host1"
root@docker-client:~# docker context  ls
NAME             DESCRIPTION                               DOCKER ENDPOINT               KUBERNETES ENDPOINT   ORCHESTRATOR
default          Current DOCKER_HOST based configuration   unix:///var/run/docker.sock                         swarm
docker-host1 *                                             ssh://ashu@172.31.31.222

```

### example of context 

```
docker context  ls
NAME             DESCRIPTION                               DOCKER ENDPOINT               KUBERNETES ENDPOINT   ORCHESTRATOR
default          Current DOCKER_HOST based configuration   unix:///var/run/docker.sock                         swarm
docker-host1 *                                             ssh://ashu@172.31.31.222                            
root@docker-client:~# docker  context use default
default
Current context is now "default"
root@docker-client:~# docker context  ls
NAME           DESCRIPTION                               DOCKER ENDPOINT               KUBERNETES ENDPOINT   ORCHESTRATOR
default *      Current DOCKER_HOST based configuration   unix:///var/run/docker.sock                         swarm
docker-host1                                             ssh://ashu@172.31.31.222                            
root@docker-client:~# docker  images
REPOSITORY   TAG       IMAGE ID       CREATED        SIZE
final        v1        bf7c812208aa   42 hours ago   1.23GB
ubuntu       ashu      8f6fb41ddcfe   42 hours ago   2.21MB
focal        latest    217fe04a1fda   43 hours ago   322MB
ubuntu       latest    d2e4e1f51132   2 weeks ago    77.8MB
root@docker-client:~# docker context  use docker-host1
docker-host1
Current context is now "docker-host1"
root@docker-client:~# docker  images
REPOSITORY       TAG       IMAGE ID       CREATED        SIZE
atriwebapp123    v001      a6ff19c963b8   17 hours ago   142MB
indrawebapp      v0011     a250ddd1d553   17 hours ago   142MB
motawebapp       v001      3a4c75bb6ad6   17 hours ago   142MB
motawebapp       v0011     3a4c75bb6ad6   17 hours ago   142MB
mattwebapp       2.0       91fb8196b26d   17 hours ago   142MB
```


