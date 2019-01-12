
sudo docker run --detach \
    --name mongo-lab \
    --restart always \
    --publish 27017:27017 \
    --volume /apps/mongodb/db:/data/db \
    mongo:4.0.5 --auth


sudo docker exec -it mongo-lab bash


# Create the admin user
MONGODB_ADMIN_USER=${MONGODB_ADMIN_USER:-"admin"}
MONGODB_ADMIN_PASS=${MONGODB_ADMIN_PASS:-"4dmP4ssw0rd"}

mongo admin --eval "db.createUser({user: '$MONGODB_ADMIN_USER', pwd: '$MONGODB_ADMIN_PASS', roles:[{role:'root',db:'admin'}]});"
