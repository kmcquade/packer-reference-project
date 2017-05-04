SHELL=/usr/bin/env bash

.PHONY: all setup lint roles

all: lint roles

lint:
	@pip install --quiet --user -r requirements.txt
	@pre-commit install

roles:
	@ansible-galaxy install --ignore-certs -r Ansiblefile.yml

amazon-linux:
	packer build packer-amazon-linux.json

ubuntu:
	packer build packer-ubuntu-16-04.json
