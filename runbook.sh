#sudo rm -rf /apps/mongodb

sudo mkdir -p /apps/mongodb/data
sudo chmod 770 /apps/mongodb
sudo chown 2049:2049 /apps/mongodb
sudo chmod 770 /apps/mongodb/data
sudo chown 2049:2049 /apps/mongodb/data



sudo docker build -t bigdataplot/mongo:1.21 .

sudo docker run --detach \
    --name mongo-lab \
    --publish 27017:27017 \
    --volume /apps/mongodb/data/db:/data/db \
    bigdataplot/mongo:1.21

sudo docker exec mongo-lab /apps/mongodb/set_auth.sh

sudo docker rm mongo-lab

sudo docker run --detach \
    --name mongo-lab \
    --restart always \
    --publish 27017:27017 \
    --volume /apps/mongodb/data/db:/data/db \
    bigdataplot/mongo:1.21 --auth



sudo docker exec -it mongo-lab bash

# Test
mongo -u admin -p '4dmP4ssw0rd' --authenticationDatabase admin