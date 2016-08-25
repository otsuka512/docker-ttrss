# Makefile for docker-node project

TAGNAME  = otsuka512/docker-ttrss
CONTNAME = ttrss_ttrss_1
SRVDIR = /srv/docker/ttrss

backup:
	./backup.sh

rebuild:
	docker build -t $(TAGNAME) --no-cache .

build:
	docker build -t $(TAGNAME) .

shell:
	docker exec -i -t $(CONTNAME) /bin/bash

stop:
	sudo cp docker-compose.yml $(SRVDIR)
	cd $(SRVDIR) ; docker-compose stop

rm:
	sudo cp docker-compose.yml $(SRVDIR)
	cd $(SRVDIR) ; docker-compose rm

run:
	sudo cp docker-compose.yml $(SRVDIR)
	cd $(SRVDIR) ; docker-compose up -d

logs:
	docker logs $(CONTNAME)

tag:
	docker tag $(TAGNAME) $(TAGNAME):$(shell date +%Y%m%d)

# Eof
