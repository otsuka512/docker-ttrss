# Makefile for docker-node project

TAGNAME  = otsuka512/docker-ttrss
CONTNAME = ttrss

backup:
	./backup.sh

build:
	docker build -t $(TAGNAME) .

shell:
	docker exec -i -t ttrss /bin/bash

start:
	sudo initctl start docker-$(CONTNAME)

stop:
	sudo initctl stop docker-$(CONTNAME)

rm:
	docker rm $(CONTNAME)

run:
	sudo docker-compose up -d
	sleep 5
	sudo initctl start docker-$(CONTNAME)

logs:
	docker logs $(CONTNAME)

tag:
	docker tag $(TAGNAME) $(TAGNAME):$(shell date +%Y%m%d)

# Eof
