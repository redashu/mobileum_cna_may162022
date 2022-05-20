# mobileum_cna_may162022

## Session Plan :-  

<img src="plan.png">

### day4 related questions 

### example of compsoe 

```
ashu@ip-172-31-31-222 ashu_scripts]$ cat multi_app.yaml 
version: '3.8' # this is compose file version
networks:
  ashubrx111:
volumes:
  ashudbvol111:
services:
 ashuapp4:
   image: mysql
   container_name: ashudbc1
   environment:
     MYSQL_ROOT_PASSWORD: "Docker@099#"
   volumes:
   -  ashudbvol111: /var/lib/mysql/
   networks:
   - ashubrx111 
 ashuapp3: # third app
  image: ashuwebapp:v0011 
  build: # building image 
   context: mobapp_demo # location of dockerfile
  container_name: ashuc3
  ports:
  - 9900:80
  depends_on:
  - ashuapp4 
 ashuapp2: # second app 
  image: ashuwebapp:v001
  container_name: ashuc2
  restart: always
  ports: # port forwarding 
  - 1234:80 
 ashuapp1: # name of app
  image: alpine
  container_name: ashuc1
  command: ping localhost
  restart: always 
```
### POrtainer as docker webui Client 

```
$ docker run -itd --name webui -v /var/run/docker.sock:/var/run/docker.sock -p 9000:9000  portainer/portainer 
```

### k8s arch 

<img src="k8sarch.png">

### k8s apiserver as number of api version exposed with resources 

<img src="apis1.png">

### list of api resources 

```
kubectl  api-resources
```

## Getting started with Pods 

### POD1 example 

```

```

### Deploy pod 

```
 kubectl create  -f  ashupod1.yaml 
pod/ashupod-007 created
[ashu@ip-172-31-31-222 k8s_apps]$ kubectl get  pods
NAME          READY   STATUS    RESTARTS   AGE
alexpod-007   1/1     Running   0          2s
ashupod-007   1/1     Running   0          4s
mattalp       1/1     Running   0          7s
```

### troubleshoot 

```
 kubectl describe  pod  davewpod-007
Name:         davewpod-007
Namespace:    default
Priority:     0
Node:         minion1/172.31.83.4
Start Time:   Fri, 20 May 2022 08:43:48 +0000
Labels:       <none>
Annotations:  cni.projectcalico.org/containerID: 04d2e35866bb86be4efbdabe6eb87465f6c6430fe7c5322bde6e6f2337192d47
              cni.projectcalico.org/podIP: 192.168.34.17/32
              cni.projectcalico.org/podIPs: 192.168.34
```

### remove a pod 

```
kubectl  delete pod deepapod1
pod "deepapod1" deleted

```

### container shell 

```
 kubectl   exec -it   ashupod-007  -- bash 
root@ashupod-007:/# 
root@ashupod-007:/# 
root@ashupod-007:/# 
root@ashupod-007:/# ls
bin   dev		   docker-entrypoint.sh  home  lib64  mnt  proc  run   srv  tmp  var
boot  docker-entrypoint.d  etc			 lib   media  opt  root  sbin  sys  usr
root@ashupod-007:/# exit
exit

```

### checking logs 

```
kubectl  logs ashupod-007
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2022/05/20 08:43:43 [notice] 1#1: using the "epoll" event method
```

### delete pods 

```
 kubectl  delete pods --all
pod "alexpod-007" deleted
pod "arpitapod-001" deleted
pod "ashupod-007" deleted
pod "davewpod-007" deleted
pod "davidpod-001" deleted

```



