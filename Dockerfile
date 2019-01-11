#  Copyright (c) BigDataPlot LLC
#  Distributed Under GNU GENERAL PUBLIC LICENSE

## ========== Begin-Of-Dockerfile ==========
## Build Base
FROM mongo:3.6.9

MAINTAINER Yongjian(Ken) Ouyang <yongjian.ouyang@outlook.com>


## Base Update
RUN umask 022
RUN apt-get update && \
    apt-get upgrade -y


## Configure AUTH
COPY set_auth.sh set_auth.sh

RUN sed -i 's/\r$//' set_auth.sh && \
    chmod +x set_auth.sh

RUN ./set_auth.sh && \
	sleep 5 && \
	rm set_auth.sh


## Cleaning
RUN apt-get clean -y && \
	apt-get autoremove -y


## Execute
EXPOSE 27017 27017
CMD ["mongod"]