#  Copyright (c) BigDataPlot LLC
#  Distributed Under GNU GENERAL PUBLIC LICENSE

## ========== Begin-Of-Dockerfile ==========
## Build Base
FROM mongo:4.0.5

MAINTAINER Yongjian(Ken) Ouyang <yongjian.ouyang@outlook.com>


## Fix UID/GID
RUN usermod -u 11001 mongodb
RUN find / -user 999 -exec chown -h 11001 {} \; ; exit 0

RUN groupmod -g 11001 mongodb
RUN find / -group 999 -exec chgrp -h 11001 {} \; ; exit 0
RUN usermod -g 11001 mongodb


## Base Update
RUN umask 022
RUN apt-get update && \
    apt-get upgrade -y


## AUTH Configure File
COPY set_auth.sh /apps/mongodb/set_auth.sh

RUN sed -i 's/\r$//' /apps/mongodb/set_auth.sh && \
    chmod +x /apps/mongodb/set_auth.sh


## Cleaning
RUN apt-get autoremove -y && \
	apt-get clean


## Execute
EXPOSE 27017 27017
CMD ["mongod"]
