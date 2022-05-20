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


