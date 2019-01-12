# MongoDB
- ### MongoDB on Docker with Auth Enabled

- ### Bring up MongoDB container
shell```
sudo docker run --detach \
    --name mongo-lab \
    --restart always \
    --publish 27017:27017 \
    --volume /apps/mongodb/db:/data/db \
    bigdataplot/mongox
```

- ### Configure Auth in mongoDB container (Skip this if Auth is set)
shell```
sudo docker exec -it mongo-lab bash
```

shell```
# Create the admin user
MONGODB_ADMIN_USER=${MONGODB_ADMIN_USER:-"admin"}
MONGODB_ADMIN_PASS=${MONGODB_ADMIN_PASS:-"4dmP4ssw0rd"}
mongo admin --eval "db.createUser({user: '$MONGODB_ADMIN_USER', pwd: '$MONGODB_ADMIN_PASS', roles:[{role:'root',db:'admin'}]});"
```