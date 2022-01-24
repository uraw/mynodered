# -*- mode: Makefile -*-

DIRECTORY := /opt/node-red
SYSTEMD_SERVICE := node-red
CONTAINER_NAME := node-red

install:
	@sudo mkdir -p $(DIRECTORY)
	@$(MAKE) copyfiles
	@sudo ln -fs $(DIRECTORY)/$(SYSTEMD_SERVICE).service /etc/systemd/system/$(SYSTEMD_SERVICE).service

	@sudo systemctl enable $(SYSTEMD_SERVICE)

	@echo $(SYSTEMD_SERVICE) installed

update:
	@$(MAKE) copyfiles
	@sudo systemctl daemon-reload
	@echo $(SYSTEMD_SERVICE) updated

copyfiles:
	@sudo cp docker-compose.yml $(DIRECTORY)
	@sudo cp $(SYSTEMD_SERVICE).service $(DIRECTORY)

uninstall:
	@sudo systemctl disable $(SYSTEMD_SERVICE)
	@sudo systemctl stop $(SYSTEMD_SERVICE)
	@sudo docker container rm $(CONTAINER_NAME)

	@echo $(SYSTEMD_SERVICE) uninstalled, should remove $(DIRECTORY) manually
