Prerequisites:
Docker
Docker Compose

PS C:\Users\Admin\PostgresPgAdmin> docker version
Client:
 Version:           27.2.0
 API version:       1.47
 Go version:        go1.21.13
 Git commit:        3ab4256
 Built:             Tue Aug 27 14:17:17 2024
 OS/Arch:           windows/amd64
 Context:           desktop-linux

Server: Docker Desktop 4.34.3 (170107)
 Engine:
  Version:          27.2.0
  API version:      1.47 (minimum version 1.24)
  Go version:       go1.21.13
  Git commit:       3ab5c7d
  Built:            Tue Aug 27 14:15:15 2024
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.7.20
  GitCommit:        8fc6bcff51318944179630522a095cc9dbf9f353
 runc:
  Version:          1.1.13
  GitCommit:        v1.1.13-0-g58aa920
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
  
PS C:\Users\Admin\PostgresPgAdmin> docker compose version
Docker Compose version v2.29.2-desktop.2
PS C:\Users\Admin\PostgresPgAdmin>




Files using:
.env
docker-compose.yml




PS C:\Users\Admin\PostgresPgAdmin> docker compose up -d
[+] Running 32/32
 ✔ db Pulled                                                                                                                                          17.3s
   ✔ a480a496ba95 Pull complete                                                                                                                        4.0s
   ✔ f5ece9c40e2b Pull complete                                                                                                                        4.0s
   ✔ 241e5725184f Pull complete                                                                                                                        4.2s
   ✔ 6832ae83547e Pull complete                                                                                                                        4.2s
   ✔ 4db87ef10d0d Pull complete                                                                                                                        4.6s
   ✔ 979fa3114f7b Pull complete                                                                                                                        4.7s
   ✔ f2bc6009bf64 Pull complete                                                                                                                        4.8s
   ✔ c9097748b1df Pull complete                                                                                                                        4.8s
   ✔ 9d5c934890a8 Pull complete                                                                                                                       12.8s
   ✔ d14a7815879e Pull complete                                                                                                                       12.9s
   ✔ 442a42d0b75a Pull complete                                                                                                                       12.9s
   ✔ 82020414c082 Pull complete                                                                                                                       12.9s
   ✔ b6ce4c941ce7 Pull complete                                                                                                                       13.0s
   ✔ 42e63a35cca7 Pull complete                                                                                                                       13.0s
 ✔ pgadmin Pulled                                                                                                                                     28.5s
   ✔ 43c4264eed91 Pull complete                                                                                                                        8.1s
   ✔ 5822ea7457a6 Pull complete                                                                                                                       20.6s
   ✔ ced9be24bc0b Pull complete                                                                                                                       20.8s
   ✔ 59a3f334794e Pull complete                                                                                                                       20.9s
   ✔ be442bce184c Pull complete                                                                                                                       20.9s
   ✔ e4377a41f615 Pull complete                                                                                                                       20.9s
   ✔ dd8c1720fb54 Pull complete                                                                                                                       21.0s
   ✔ 3456e0e8eaa2 Pull complete                                                                                                                       21.0s
   ✔ 3c97d49c85c1 Pull complete                                                                                                                       22.0s
   ✔ 4001efe348b6 Pull complete                                                                                                                       22.5s
   ✔ 2a4d604e49f7 Pull complete                                                                                                                       22.5s
   ✔ a2d0b0bf092a Pull complete                                                                                                                       22.5s
   ✔ bb05ea188b6c Pull complete                                                                                                                       22.5s
   ✔ 442af539f3c3 Pull complete                                                                                                                       22.5s
   ✔ 397621568e19 Pull complete                                                                                                                       22.6s
   ✔ 5ceb81c83f98 Pull complete                                                                                                                       23.9s
[+] Running 5/5
 ✔ Network postgrespgadmin_default    Created                                                                                                          0.0s
 ✔ Volume "postgrespgadmin_pgadmin"   Created                                                                                                          0.0s
 ✔ Volume "postgrespgadmin_postgres"  Created                                                                                                          0.0s
 ✔ Container postgres_container       Started                                                                                                          0.9s
 ✔ Container pgadmin4_container       Started                                                                                                          0.7s
PS C:\Users\Admin\PostgresPgAdmin>

PS C:\Users\Admin\PostgresPgAdmin> docker ps
CONTAINER ID   IMAGE            COMMAND                  CREATED         STATUS         PORTS                           NAMES
3c03c0417276   dpage/pgadmin4   "/entrypoint.sh"         2 minutes ago   Up 2 minutes   443/tcp, 0.0.0.0:5050->80/tcp   pgadmin4_container
2fc0352409d3   postgres         "docker-entrypoint.s…"   2 minutes ago   Up 2 minutes   0.0.0.0:5432->5432/tcp          postgres_container

PS C:\Users\Admin\PostgresPgAdmin> docker images
REPOSITORY       TAG       IMAGE ID       CREATED       SIZE
postgres         latest    d57ed788c154   3 weeks ago   434MB
dpage/pgadmin4   latest    a67d330eef3b   4 weeks ago   485MB
PS C:\Users\Admin\PostgresPgAdmin>

PS C:\Users\Admin\SpringBootOne\simple> docker compose ls   
NAME                STATUS              CONFIG FILES
simple              running(2)          C:\Users\Admin\simple\docker-compose.yml

PS C:\Users\Admin\SpringBootOne\simple> docker compose ps
NAME                 IMAGE            COMMAND                  SERVICE   CREATED         STATUS         PORTS
pgadmin4_container   dpage/pgadmin4   "/entrypoint.sh"         pgadmin   4 minutes ago   Up 4 minutes   443/tcp, 0.0.0.0:5050->80/tcp
postgres_container   postgres         "docker-entrypoint.s…"   db        4 minutes ago   Up 4 minutes   0.0.0.0:5432->5432/tcp

PS C:\Users\Admin\PostgresPgAdmin> docker compose top
pgadmin4_container
UID    PID    PPID   C    STIME   TTY   TIME       CMD
5050   5389   5370   0    10:27   ?     00:00:00   /venv/bin/python3 /venv/bin/gunicorn --limit-request-line 8190 --timeout 86400 --bind [::]:80 -w 1 --threads 25 --access-logfile - -c gunicorn_config.py run_pgadmin:app
root   5562   5389   0    10:27   ?     00:00:00   /usr/libexec/postfix/master -w

_rpc   5563   5562   0    10:27   ?     00:00:00   pickup -l -t unix -u

_rpc   5564   5562   0    10:27   ?     00:00:00   qmgr -l -t unix -u

5050   5566   5389   2    10:28   ?     00:00:06   /venv/bin/python3 /venv/bin/gunicorn --limit-request-line 8190 --timeout 86400 --bind [::]:80 -w 1 --threads 25 --access-logfile - -c gunicorn_config.py run_pgadmin:app

postgres_container
UID   PID    PPID   C    STIME   TTY   TIME       CMD
999   5287   5268   0    10:27   ?     00:00:00   postgres
999   5462   5287   0    10:27   ?     00:00:00   postgres: checkpointer
999   5463   5287   0    10:27   ?     00:00:00   postgres: background writer
999   5465   5287   0    10:27   ?     00:00:00   postgres: walwriter
999   5466   5287   0    10:27   ?     00:00:00   postgres: autovacuum launcher
999   5467   5287   0    10:27   ?     00:00:00   postgres: logical replication launcher
 




Now, both Posgres and pgAdmin containers should be up and running.

Access pgAdmin using, http://localhost:5050/browser/
PGADMIN_DEFAULT_EMAIL=admin@admin.com
PGADMIN_DEFAULT_PASSWORD=root


sample 
CREATE TABLE users(id SERIAL PRIMARY KEY, name TEXT NOT NULL, location TEXT NOT NULL);
INSERT INTO users VALUES  (1, 'srirama', 'ayodhya');
INSERT INTO users VALUES (2, 'srirama', 'mithila');
SELECT * FROM users;
"id","name","location"
1,"srirama","ayodhya"
2,"srirama","mithila"

PS C:\Users\Admin\PostgresPgAdmin> docker compose down
[+] Running 3/3
 ✔ Container pgadmin4_container     Removed                                                                                                            1.2s
 ✔ Container postgres_container     Removed                                                                                                            0.5s
 ✔ Network postgrespgadmin_default  Removed                                                                                                            0.2s
PS C:\Users\Admin\PostgresPgAdmin>

PS C:\Users\Admin\SpringBootOne\PostgresPgAdmin> docker compose down
[+] Running 3/3
 ✔ Container pgadmin4_container     Removed                                                                                                            1.2s
 ✔ Container postgres_container     Removed                                                                                                            0.5s
 ✔ Network postgrespgadmin_default  Removed                                                                                                            0.2s
PS C:\Users\Admin\SpringBootOne\PostgresPgAdmin> docker compose up -d
[+] Running 3/3
 ✔ Network postgrespgadmin_default  Created                                                                                                            0.0s
 ✔ Container postgres_container     Started                                                                                                            0.5s
 ✔ Container pgadmin4_container     Started                                                                                                            0.7s
PS C:\Users\Admin\SpringBootOne\PostgresPgAdmin>

SELECT * FROM users;
"id","name","location"
1,"srirama","ayodhya"
2,"srirama","mithila"

Note: 
We enabled volumes for both Postgres and pgAdmin
Data will be persisted even after containers are down, data will get persisted until they got deleted



