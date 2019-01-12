#  Copyright (c) BigDataPlot LLC
#  Distributed Under GNU GENERAL PUBLIC LICENSE

## ========== Begin-Of-Dockerfile ==========
## Build Base
FROM mongo:4.0.5

MAINTAINER Yongjian(Ken) Ouyang <yongjian.ouyang@outlook.com>


## Base Update
RUN umask 022
RUN apt-get update && \
    apt-get upgrade -y

## Cleaning
RUN apt-get clean -y && \
    apt-get autoremove -y


## Execute
EXPOSE 27017 27017
CMD ["mongod","--auth"]