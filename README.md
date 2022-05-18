# mobileum_cna_may162022

## Session Plan :-  

<img src="plan.png">

### AUTOmation using jenkins [CI|CD]

<img src="cicd.png">

## COntainer networking 

### networking modesl 

<img src="net1.png">

### Docker bridge 

<img src="br1.png">

### default offering by docker in terms of networking 

```
docker  network   ls
NETWORK ID     NAME      DRIVER    SCOPE
292213702b4e   bridge    bridge    local
1c268364e90f   host      host      local
c6ccda1f2c68   none      null      local
[ashu@ip-172-31-31-222 ~]$ 
[ashu@ip-172-31-31-222 ~]$ 
[ashu@ip-172-31-31-222 ~]$ docker  network  inspect  bridge 
[
    {
        "Name": "bridge",
        "Id": "292213702b4e4af3f68d173c88a91f4ae8c073ce6c9d0362034bae67627d31fb",
        "Created": "2022-05-18T08:14:14.48866762Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"

```

### all containers by default fall in default bridge for network purpose 

<img src="net2.png">


