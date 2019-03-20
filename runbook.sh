#sudo rm -rf /apps/mongodb

sudo mkdir -p /apps/mongodb/data

sudo chmod 770 /apps/mongodb
sudo chown 11001:11001 /apps/mongodb

sudo chmod 770 /apps/mongodb/data
sudo chown 11001:11001 /apps/mongodb/data



sudo docker build -t bigdataplot/mongo:1.22 .


sudo docker run --detach \
    --name mongo-lab \
    --publish 27017:27017 \
    --volume /apps/mongodb/data/db:/data/db \
    --volume /apps/datahub/.tmp:/tmp \
    --volume /etc/localtime:/etc/localtime:ro \
    bigdataplot/mongo:1.21

sudo docker exec mongo-lab /apps/mongodb/set_auth.sh

sudo docker rm mongo-lab

sudo docker run --detach \
    --name mongo-lab \
    --restart always \
    --publish 27017:27017 \
    --volume /apps/mongodb/data/db:/data/db \
    --volume /etc/localtime:/etc/localtime:ro \
    bigdataplot/mongo:1.21 --auth




sudo docker build -t mongo:1.22 .

sudo docker run --detach \
    --name mongo-lab \
    --publish 27017:27017 \
    --volume /apps/mongodb/data/db:/data/db \
    --volume /apps/datahub/.tmp:/tmp \
    --volume /etc/localtime:/etc/localtime:ro \
    mongo:1.22

sudo docker exec mongo-lab /apps/mongodb/set_auth.sh

sudo docker rm mongo-lab

sudo docker run --detach \
    --name mongo-lab \
    --restart always \
    --publish 27017:27017 \
    --volume /apps/mongodb/data/db:/data/db \
    --volume /apps/datahub/.tmp:/tmp \
    --volume /etc/localtime:/etc/localtime:ro \
    mongo:1.22 --auth


# Not working:
## For Supervisor
sudo docker run -itd \
    --name mongo-lab \
    --restart always \
    --publish 27017:27017 \
    --volume /apps/mongodb/data/db:/data/db \
    --volume /etc/localtime:/etc/localtime:ro \
    bigdataplot/mongo:1.51 bash


sudo docker run --detach \
    --name mongo-lab \
    --restart always \
    --publish 27017:27017 \
    --volume /apps/mongodb/data/db:/data/db \
    --volume /etc/localtime:/etc/localtime:ro \
    bigdataplot/mongo:1.51



sudo docker exec -it mongo-lab bash

# Test
mongo -u admin -p '4dmP4ssw0rd' --authenticationDatabase admin


# Create New User and DB

db.dropUser('user01');

use db001;

db.createUser(
  {
    user: "user01",
    pwd: "xxxx1234",
    roles: [
        {
            role: "readWrite",
            db: "db001"
        },
    ],
    mechanisms: [
        "SCRAM-SHA-1"
    ],
  }
);
