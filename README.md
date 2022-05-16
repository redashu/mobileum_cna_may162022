# mobileum_cna_may162022

## Session Plan :-  

<img src="plan.png">

### app deployment probelms in History 

<img src="app1.png">

### problem with VM 

<img src="app2.png">

### OS understanding 

<img src="os.png">

### Introduction to containers 

<img src="cr.png">

### VM vs containers 

<img src="cont111.png">

### Docker as container  platform 

<img src="docker.png">

### Docker installation on Host cloud 

```
 7  for  i  in  ashu  alex arpita atri mota dave david deepa lepipas  rosas indrajeet lopes lam   malli matt neha nikos nitin pradeep sanaya shah bruce  steven tsaimos ; do useradd $i; echo "Docker@099#"  |  passwd $i --stdin ; done
    8  vim /etc/ssh/sshd_config 
    9  systemctl restart sshd
   10  history 
   11  yum  install  docker -y
   12  systemctl start docker
   13  systemctl status docker
   14  systemctl enable  docker
```

### Non root users can't use docker access 

```
[ashu@ip-172-31-31-222 ~]$ whoami
ashu
[ashu@ip-172-31-31-222 ~]$ docker  version 
Client:
 Version:           20.10.13
 API version:       1.41
 Go version:        go1.16.15
 Git commit:        a224086
 Built:             Thu Mar 31 19:20:32 2022
 OS/Arch:           linux/amd64
 Context:           default
 Experimental:      true
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/version": dial unix /var/run/docker.sock: connect: permission denied
```

### solution -- ON the docker server side 

```
 for  i  in  ashu  alex arpita atri mota dave david deepa lepipas  rosas indrajeet lopes lam   malli matt neha nikos nitin pradeep sanaya shah bruce  steven tsaimos 
> do
> usermod -aG docker  $i 
> done
[root@ip-172-31-31-222 ~]# 
[root@ip-172-31-31-222 ~]# 
[root@ip-172-31-31-222 ~]# grep -i docker  /etc/group
docker:x:992:ashu,alex,arpita,atri,mota,dave,david,deepa,lepipas,rosas,indrajeet,lopes,lam,malli,matt,neha,nikos,nitin,pradeep,sanaya,shah,bruce,steven,tsaimos
[root@ip-172-31-31-222 ~]# 
[root@ip-172-31-31-222 ~]# 
[root@ip-172-31-31-222 ~]# usermod -a -G  docker  ec2-user
[root@ip-172-31-31-222 ~]# 


```

### reconnection 

```
 docker  -v
Docker version 20.10.13, build a224086
[ashu@ip-172-31-31-222 ~]$ docker  version 
Client:
 Version:           20.10.13
 API version:       1.41
 Go version:        go1.16.15
 Git commit:        a224086
 Built:             Thu Mar 31 19:20:32 2022
 OS/Arch:           linux/amd64
 Context:           default
 Experimental:      true

Server:
 Engine:
  Version:          20.10.13
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.16.15
  Git commit:       906f57f

```

### Docker. architecture 

<img src="darch.png">

## creating containers like VMs

### Container images --

<img src="img.png">

### searching imgaes on docker hub 

```
docker  search  java
NAME                                 DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
node                                 Node.js is a JavaScript-based platform for s…   11457     [OK]       
tomcat                               Apache Tomcat is an open source implementati…   3319      [OK]       
openjdk                              "Vanilla" builds of OpenJDK (an open-source …   3278      [OK]       
java                                 DEPRECATED; use "openjdk" (or other JDK impl…   1976      [OK]       
ghost                                Ghost is a free and open source blogging pla…   1503      [OK]       
couchdb                              CouchDB is a database that uses JSON for doc…   474       [OK]       
jetty                                Jetty provides a Web server and javax.servle…   384       [OK]       
amazoncorretto                       Corretto is a no-cost, production-ready dist…   205       [OK]       
circleci/node                        Node.js is a JavaScript-based platform for s…   128                  
groovy                               Apache Groovy is a multi-faceted language fo…   127       [OK]       
ibmjava                              Off
```

### pulling images from docker hub to docker host -- using docker client 

```
  19  docker  pull alpine 
   20  docker  pull openjdk 
   21  history 
   22  docker images
   23  docker pull mysql
   24  docker pull postgres
   25  history 
   26  docker  images
   27  docker pull python:3.7-buster
   28  docker  images
   29  docker pull python
   30  history 
[ashu@ip-172-31-31-222 ~]$ docker  images
REPOSITORY   TAG          IMAGE ID       CREATED        SIZE
postgres     latest       9dbc24674f25   4 days ago     376MB
python       3.7-buster   9e9a1e177aed   5 days ago     880MB
python       latest       bda19bf988a7   5 days ago     919MB
mysql        latest       76152be68449   5 days ago     524MB
openjdk      latest       5e28ba2b4cdb   2 weeks ago    471MB
alpine       latest       0ac33e5f5afa   5 weeks ago    5.57MB
centos       latest       5d0da3dc9764   8 months ago   231MB
```
### Container creation 

<img src="cc.png">

### creating first container 

<img src="ccc.png">

### creating and list running containers 

```
 docker  run  --name  ashuc1  -d   alpine:latest      ping  localhost 
46c18bce43926636dd1750dc36cf5a91520a04d9a343bfb5a344d29465acd396
[ashu@ip-172-31-31-222 ~]$ docker  ps
CONTAINER ID   IMAGE           COMMAND            CREATED          STATUS          PORTS     NAMES
3e49aac417f9   alpine:latest   "ping localhost"   38 seconds ago   Up 37 seconds             mattc1
47d554121e61   alpine:latest   "ping localhost"   45 seconds ago   Up 44 seconds             rosasc1
46c18bce4392   alpine:latest   "ping localhost"   51 seconds ago   Up 50 seconds             ashuc1
```

### checking output of programe running inside a container 

```
docker logs  ashuc1
PING localhost (127.0.0.1): 56 data bytes
64 bytes from 127.0.0.1: seq=0 ttl=64 time=0.044 ms
64 bytes from 127.0.0.1: seq=1 ttl=64 time=0.046 ms
64 bytes from 127.0.0.1: seq=2 ttl=64 time=0.054 ms
64 bytes from 127.0.0.1: seq=3 ttl=64 time=0.050 ms
64 bytes from 127.0.0.1: seq=4 ttl=64 time=0.055 ms
64 bytes from 127.0.0.1: seq=5 ttl=6
```

### check container resource consumption 

```
 docker  stats    ashuc1  
 CONTAINER ID   NAME      CPU %     MEM USAGE / LIMIT   MEM %     NET I/O       BLOCK I/O   PIDS
46c18bce4392   ashuc1    0.01%     280KiB / 15.44GiB   0.00%     1.07kB / 0B   0B / 0B     1
^C

```

### stop running containers 

```
docker  stop   ashuc1
```

### starting the same container 

```
docker  start  ashuc1
ashuc1

```

### access shell of a running container 

```
[ashu@ip-172-31-31-222 ~]$ cat  /etc/os-release 
NAME="Amazon Linux"
VERSION="2"
ID="amzn"
ID_LIKE="centos rhel fedora"
VERSION_ID="2"
PRETTY_NAME="Amazon Linux 2"
ANSI_COLOR="0;33"
CPE_NAME="cpe:2.3:o:amazon:amazon_linux:2"
HOME_URL="https://amazonlinux.com/"
[ashu@ip-172-31-31-222 ~]$ uname -r
5.10.109-104.500.amzn2.x86_64
[ashu@ip-172-31-31-222 ~]$ 
[ashu@ip-172-31-31-222 ~]$ 
[ashu@ip-172-31-31-222 ~]$ docker  exec  -it  ashuc1   sh 
/ # 
/ # uname  -r 
5.10.109-104.500.amzn2.x86_64
/ # cat /etc/os-release 
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.15.4
PRETTY_NAME="Alpine Linux v3.15"
HOME_URL="https://alpinelinux.org/"
BUG_REPORT_URL="https://bugs.alpinelinux.org/"
/ # exit

```
### solution 1 

```
[ashu@ip-172-31-31-222 ~]$ docker  run -d  --name ashuc1  alpine  ping localhost 
2ad27f97cf2ce1e34549b944e932eac95378cffccd402109f2fd12eb0a857e7c
[ashu@ip-172-31-31-222 ~]$ 
[ashu@ip-172-31-31-222 ~]$ 
[ashu@ip-172-31-31-222 ~]$ docker  run -d  --name ashuc2  alpine  ping localhost 
84519679d668ef6c3fd95ca8cdd961d8bc472f4a89d7e708e3c2e4c2d598dbd7
[ashu@ip-172-31-31-222 ~]$ docker exec -it ashuc1  sh 
/ # 
/ # 
/ # pwd
/
/ # ls
bin    dev    etc    home   lib    media  mnt    opt    proc   root   run    sbin   srv    sys    tmp    usr    var
/ # echo  ashutoshh   >helloc1.txt 
/ # ls
bin          etc          home         media        opt          root         sbin         sys          usr
dev          helloc1.txt  lib          mnt          proc         run          srv          tmp          var
/ # cat  helloc1.txt 
ashutoshh
/ # exit
[ashu@ip-172-31-31-222 ~]$ docker  cp  ashuc1:/helloc1.txt  . 
[ashu@ip-172-31-31-222 ~]$ ls
helloc1.txt
[ashu@ip-172-31-31-222 ~]$ docker  cp helloc1.txt  ashuc2:/
```
### application containerization -- source code -- docker image - docker containers 

<img src="appc.png">


## Docker tips 
### remove all running containers
```
docker  rm   $(docker  ps  -q)  -f
```

### stop all running containers 

```
docker  stop   $(docker  ps  -q) 
```
### building first docker image using dockerfile 
```
 cd python_app_image/
[ashu@ip-172-31-31-222 python_app_image]$ ls
Dockerfile  mob.py
[ashu@ip-172-31-31-222 python_app_image]$ docker  build  -t  ashypyapp:1.0  . 
Sending build context to Docker daemon  3.072kB
Step 1/6 : FROM python
 ---> bda19bf988a7
Step 2/6 : LABEL email=ashutoshh@linux.com
 ---> Running in c5164561fd04
Removing intermediate container c5164561fd04
 ---> 5319235fc03f
Step 3/6 : LABEL name=ashutoshh
 ---> Running in d15c19a1cffd
Removing intermediate container d15c19a1cffd
 ---> d87db0e2f8d3
Step 4/6 : RUN  mkdir /mob_project
 ---> Running in beaca19fbf07
Removing intermediate container beaca19fbf07
 ---> 208159913d74
Step 5/6 : COPY mob.py  /mob_project/mob.py
 ---> e3d007df7eac
Step 6/6 : CMD  ["python","/mob_project/mob.py"]
 ---> Running in 5de9adc5d4de
Removing intermediate container 5de9adc5d4de
 ---> 0512a4e7a43a
Successfully built 0512a4e7a43a
Successfully tagged ashypyapp:1.0
```

### creating container 

```
 87  docker  build  -t  ashypyapp:1.0  . 
   88  history 
[ashu@ip-172-31-31-222 python_app_image]$ docker run -it  -d  --name ashupc1  ashypyapp:1.0
b161034aec4c980c215a461a9731bacb2f2310adc7cd5e7985f0fb19eea1c692
[ashu@ip-172-31-31-222 python_app_image]$ docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED          STATUS          PORTS     NAMES
b161034aec4c   ashypyapp:1.0   "python /mob_project…"   14 seconds ago   Up 13 seconds             ashupc1
```

### overall -- any app contianerization is listed below 

<img src="build.png">

### building image 

```
[ashu@ip-172-31-31-222 python_app_image]$ docker  build  -t  ashypyapp:1.1 -f  centos.dockerfile  .
Sending build context to Docker daemon  4.608kB
Step 1/7 : FROM fedora
latest: Pulling from library/fedora
e1deda52ffad: Pull complete 
Digest: sha256:cbf627299e327f564233aac6b97030f9023ca41d3453c497be2f5e8f7762d185
Status: Downloaded newer image for fedora:latest
 ---> 98ffdbffd207
Step 2/7 : LABEL email=ashutoshh@linux.com

```

### TASK 2 :

```
FROM alpine
MAINTAINER name=ashutoshh
RUN apk add python3 
# apk is installer for alpine image 
RUN mkdir /code 
ADD https://raw.githubusercontent.com/redashu/pythonLang/main/while.py /code/ 
# in copy u can't use URL while add can take local and URL sources
ENTRYPOINT  python3  /code/while.py 

```

## Intro to Container Registry 

<img src="registry.png">

### Understanding docker HUb 

<img src="dh.png">

## pushing image to docker hub 

### tag as per standard 

```
 docker  tag  ashupyapp:1.0   docker.io/dockerashu/ashuapp:v1 
[ashu@ip-172-31-31-222 python_app_image]$ docker  images
REPOSITORY           TAG       IMAGE ID       CREATED              SIZE
rosas_alppycodev1    1.0       d007102c1d95   35 seconds ago       54MB
dockerashu/ashuapp   v1        e62f72f2a8ea   About a minute ago   54MB
ashupyapp            1.0       e62f72f2a8ea   About a minute ago   54MB
```
### login to docker hub account from docker client 

```
docker  login 
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: dockerashu
Password: 
WARNING! Your password will be stored unencrypted in /home/ashu/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded

```

### pushing image to docker hub 

```
docker push  docker.io/dockerashu/ashuapp:v1
The push refers to repository [docker.io/dockerashu/ashuapp]
1b5dd0bc66eb: Pushed 
fff64d86465b: Pushed 
6672208a6be9: Pushed 
4fc242d58285: Mounted from pradeepsubudhi/pradeepapp 
v1: digest: sha256:c44bf086ff24dd05e2144ea5ccda07541b99565b145603cca9ea6b5cc1c92c93 size: 1154
[ashu@ip-172-31-31-222 python_app_image]$ 

```

### docker account logout 

```
docker logout 
Removing login credentials for https://index.docker.io/v1/
```
