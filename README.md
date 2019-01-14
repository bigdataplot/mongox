# Mongox - MongoDB on Docker with Auth Enabled

- ### Prepare Local Environment
```shell
sudo mkdir -p /apps/mongodb/data
```
```shell
sudo chmod 770 /apps/mongodb
sudo chown 2049:2049 /apps/mongodb
```
```shell
sudo chmod 770 /apps/mongodb/data
sudo chown 2049:2049 /apps/mongodb/data
```
_* Create local folders only if necessary_

- ### Build or Bring up MongoDB container from DockerHub
```shell
sudo docker build -t bigdataplot/mongo:1.21 .
```
```shell
sudo docker run --detach \
    --name mongo-lab \
    --publish 27017:27017 \
    --volume /apps/mongodb/data/db:/data/db \
    bigdataplot/mongo:1.21
```

- ### (Optional) Reset 'admin' Password on Local DB Folder
```shell
sudo docker exec mongo-lab /apps/mongodb/set_auth.sh
```
_'4dmP4ssw0rd' by default_

- ### (Optional) Rebuild MongoDB Container for Local DB Folder
```shell
sudo docker rm mongo-lab
```
```shell
sudo docker run --detach \
    --name mongo-lab \
    --restart always \
    --publish 27017:27017 \
    --volume /apps/mongodb/data/db:/data/db \
    bigdataplot/mongo:1.21 --auth
```