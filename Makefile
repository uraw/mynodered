# -*- mode: Makefile -*-

install:
	@sudo mkdir -p /opt/docker-compose-service/node-red/
	@sudo cp docker-compose.yml /opt/docker-compose-service/node-red/docker-compose.yml
	@sudo cp systemd/docker-compose-service@.service  /etc/systemd/system/

enable:
	sudo systemctl enable docker-compose-service@node-red

disable:
	sudo systemctl disable docker-compose-service@node-red

status:
	systemctl status docker-compose-service@node-red

start:
	sudo systemctl start docker-compose-service@node-red
stop:
	sudo systemctl stop docker-compose-service@node-red
