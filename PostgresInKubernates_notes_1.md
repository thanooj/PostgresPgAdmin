D:\PostgresPgAdmin> docker version
Client:
Version:           27.3.1
API version:       1.47
Go version:        go1.22.7
Git commit:        ce12230
Built:             Fri Sep 20 11:42:27 2024
OS/Arch:           windows/amd64
Context:           desktop-linux

Server: Docker Desktop 4.35.0 (172550)
Engine:
Version:          27.3.1
API version:      1.47 (minimum version 1.24)
Go version:       go1.22.7
Git commit:       41ca978
Built:            Fri Sep 20 11:41:11 2024
OS/Arch:          linux/amd64
Experimental:     false
containerd:
Version:          1.7.21
GitCommit:        472731909fa34bd7bc9c087e4c27943f9835f111
runc:
Version:          1.1.13
GitCommit:        v1.1.13-0-g58aa920
docker-init:
Version:          0.19.0
GitCommit:        de40ad0
D:\PostgresPgAdmin> docker compose version
Docker Compose version v2.29.7-desktop.1
D:\PostgresPgAdmin> kubectl version                  
Client Version: v1.30.2
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Server Version: v1.30.2


D:\PostgresPgAdmin> kubectl cluster-info
Kubernetes control plane is running at https://kubernetes.docker.internal:6443
CoreDNS is running at https://kubernetes.docker.internal:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.



D:\PostgresPgAdmin> kubectl get pods --all-namespaces                     
NAMESPACE     NAME                                     READY   STATUS    RESTARTS   AGE
default       postgres-f678886f6-bltk7                 1/1     Running   0          12m
default       postgres-f678886f6-dzpn5                 1/1     Running   0          12m
default       postgres-f678886f6-l2klc                 1/1     Running   0          12m
kube-system   coredns-7db6d8ff4d-hqbk6                 1/1     Running   0          44m
kube-system   coredns-7db6d8ff4d-ksts5                 1/1     Running   0          44m
kube-system   etcd-docker-desktop                      1/1     Running   0          44m
kube-system   kube-apiserver-docker-desktop            1/1     Running   0          44m
kube-system   kube-controller-manager-docker-desktop   1/1     Running   0          44m
kube-system   kube-proxy-t624v                         1/1     Running   0          44m
kube-system   kube-scheduler-docker-desktop            1/1     Running   0          44m
kube-system   storage-provisioner                      1/1     Running   0          44m
kube-system   vpnkit-controller                        1/1     Running   0          44m
D:\PostgresPgAdmin>


D:\PostgresPgAdmin> kubectl apply -f postgres-configmap.yml
configmap/postgres-secret created
D:\PostgresPgAdmin> kubectl get configmap
NAME               DATA   AGE
kube-root-ca.crt   1      27m
postgres-secret    3      10s

D:\PostgresPgAdmin> kubectl apply -f psql-pv.yml
persistentvolume/postgres-volume created

D:\PostgresPgAdmin> kubectl apply -f psql-claim.yml
persistentvolumeclaim/postgres-volume-claim created

D:\PostgresPgAdmin> kubectl get pv
NAME              CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                           STORAGECLASS   VOLUMEATTRIBUTESCLASS   REASON   AGE
postgres-volume   10Gi       RWX            Retain           Bound    default/postgres-volume-claim   manual         <unset>                          90s

D:\PostgresPgAdmin> kubectl get pvc
NAME                    STATUS   VOLUME            CAPACITY   ACCESS MODES   STORAGECLASS   VOLUMEATTRIBUTESCLASS   AGE
postgres-volume-claim   Bound    postgres-volume   10Gi       RWX            manual         <unset>                 55s

D:\PostgresPgAdmin> kubectl apply -f ps-deployment.yml
deployment.apps/postgres created

D:\PostgresPgAdmin> kubectl get deployments
NAME       READY   UP-TO-DATE   AVAILABLE   AGE
postgres   0/3     3            0           8s

D:\PostgresPgAdmin> kubectl get pods
NAME                       READY   STATUS              RESTARTS   AGE
postgres-f678886f6-bltk7   0/1     ContainerCreating   0          15s
postgres-f678886f6-dzpn5   0/1     ContainerCreating   0          15s
postgres-f678886f6-l2klc   0/1     ContainerCreating   0          15s

D:\PostgresPgAdmin> kubectl get pods
NAME                       READY   STATUS    RESTARTS   AGE
postgres-f678886f6-bltk7   1/1     Running   0          28s
postgres-f678886f6-dzpn5   1/1     Running   0          28s
postgres-f678886f6-l2klc   1/1     Running   0          28s

D:\PostgresPgAdmin> kubectl get deployments           
NAME       READY   UP-TO-DATE   AVAILABLE   AGE
postgres   3/3     3            3           47s

D:\PostgresPgAdmin> kubectl apply -f ps-service.yml
service/postgres created

D:\PostgresPgAdmin> kubectl get svc
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)          AGE
kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP          33m
postgres     NodePort    10.98.68.0   <none>        5432:30610/TCP   7s

D:\PostgresPgAdmin> kubectl get pods
NAME                       READY   STATUS    RESTARTS   AGE
postgres-f678886f6-bltk7   1/1     Running   0          115s
postgres-f678886f6-dzpn5   1/1     Running   0          115s
postgres-f678886f6-l2klc   1/1     Running   0          115s

D:\PostgresPgAdmin> kubectl exec -it postgres-f678886f6-bltk7 -- psql -h localhost -U root --password -p 5432 mydb
Password:
psql (14.13 (Debian 14.13-1.pgdg120+1))
Type "help" for help.

mydb=# \conninfo
You are connected to database "mydb" as user "root" on host "localhost" (address "::1") at port "5432".

mydb-# \dd
Object descriptions
Schema | Name | Object | Description
--------+------+--------+-------------
(0 rows)

mydb=# exit


D:\PostgresPgAdmin> kubectl exec -it postgres-f678886f6-bltk7 -- /bin/bash
root@postgres-f678886f6-bltk7:/# psql --d mydb
psql (14.13 (Debian 14.13-1.pgdg120+1))
Type "help" for help.

mydb=# \dd
Object descriptions
Schema | Name | Object | Description
--------+------+--------+-------------
(0 rows)

mydb=#




D:\PostgresPgAdmin> kubectl apply -f pgadmin.yml
deployment.apps/pgadmin-deployment created
service/pgadmin-service created
D:\PostgresPgAdmin

D:\PostgresPgAdmin> kubectl get pods --all-namespaces
NAMESPACE     NAME                                     READY   STATUS              RESTARTS   AGE
default       pgadmin-deployment-6cbc674766-cmwz8      0/1     ContainerCreating   0          21s
default       postgres-f678886f6-bltk7                 1/1     Running             0          32m
default       postgres-f678886f6-dzpn5                 1/1     Running             0          32m
default       postgres-f678886f6-l2klc                 1/1     Running             0          32m
kube-system   coredns-7db6d8ff4d-hqbk6                 1/1     Running             0          64m
kube-system   coredns-7db6d8ff4d-ksts5                 1/1     Running             0          64m
kube-system   etcd-docker-desktop                      1/1     Running             0          64m
kube-system   kube-apiserver-docker-desktop            1/1     Running             0          64m
kube-system   kube-controller-manager-docker-desktop   1/1     Running             0          64m
kube-system   kube-proxy-t624v                         1/1     Running             0          64m
kube-system   kube-scheduler-docker-desktop            1/1     Running             0          64m
kube-system   storage-provisioner                      1/1     Running             0          64m
kube-system   vpnkit-controller                        1/1     Running             0          64m
D:\PostgresPgAdmin> kubectl get pods --all-namespaces
NAMESPACE     NAME                                     READY   STATUS    RESTARTS   AGE
default       pgadmin-deployment-6cbc674766-cmwz8      1/1     Running   0          66s
default       postgres-f678886f6-bltk7                 1/1     Running   0          33m
default       postgres-f678886f6-dzpn5                 1/1     Running   0          33m
default       postgres-f678886f6-l2klc                 1/1     Running   0          33m
kube-system   coredns-7db6d8ff4d-hqbk6                 1/1     Running   0          65m
kube-system   coredns-7db6d8ff4d-ksts5                 1/1     Running   0          65m
kube-system   etcd-docker-desktop                      1/1     Running   0          65m
kube-system   kube-apiserver-docker-desktop            1/1     Running   0          65m
kube-system   kube-controller-manager-docker-desktop   1/1     Running   0          65m
kube-system   kube-proxy-t624v                         1/1     Running   0          65m
kube-system   kube-scheduler-docker-desktop            1/1     Running   0          65m
kube-system   storage-provisioner                      1/1     Running   0          65m
kube-system   vpnkit-controller                        1/1     Running   0          65m
D:\PostgresPgAdmin>



PgAdmin4:
http://localhost:30080/
host: postgres
user: root
pwd: root
db: mydb




#pg_dump
PS D:\codebase\samples\PostgresPgAdmin> kubectl exec -it postgres-f678886f6-bltk7 -- /bin/bash                                         
root@postgres-f678886f6-bltk7:/# pg_dump -U root --file=dump_v2.sql mydb
root@postgres-f678886f6-bltk7:/# cat dump_v2.sql
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Debian 14.13-1.pgdg120+1)
-- Dumped by pg_dump version 14.13 (Debian 14.13-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--
root@postgres-f678886f6-bltk7:/# exit
exit
PS D:\codebase\samples\PostgresPgAdmin> kubectl cp postgres-f678886f6-bltk7:dump_v2.sql dump_v2.sql                                    
PS D:\codebase\samples\PostgresPgAdmin> ls .\dump_v2.sql




#pg_restore
# list all the pods
kubectl get pods
kubectl cp dump_v2.sql postgres-f678886f6-bltk7:dump_v3.sql
# to open interactive shell
kubectl exec -it postgres-f678886f6-bltk7 /bin/sh
PS D:\codebase\samples\PostgresPgAdmin> kubectl exec -it postgres-f678886f6-bltk7 -- /bin/bash                                         
root@postgres-f678886f6-bltk7:/# ls
bin  boot  dev  docker-entrypoint-initdb.d  dump_v1.sql  dump_v2.sql  dump_v3.sql  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@postgres-f678886f6-bltk7:/# cat dump_v3.sql
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Debian 14.13-1.pgdg120+1)
-- Dumped by pg_dump version 14.13 (Debian 14.13-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--
root@postgres-f678886f6-bltk7:/#

root@postgres-f678886f6-bltk7:/# pg_restore -U root -d mydb dump_v3.sql
pg_restore: error: input file appears to be a text format dump. Please use psql.







Note: https://www.digitalocean.com/community/tutorials/how-to-deploy-postgres-to-kubernetes-cluster