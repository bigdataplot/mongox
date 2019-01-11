sudo docker build -t bigdataplot/mongox:1.00 .

sudo docker push bigdataplot/mongox:1.00

sudo docker run --detach \
    --name mongo-lab \
    --restart always \
    --publish 27017:27017 \
    --volume /apps/mongodb/db:/data/db \
     bigdataplot/mongox:1.00 --auth






