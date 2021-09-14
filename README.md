# docker-kamailio-500
![ver](https://img.shields.io/github/v/release/mach1el/docker-kamailio?color=red&style=plastic)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)]

Build and run kamailio on docker

### Pull from hub
	docker pull deizeppe/kamailio

### Build from source
	git clone https://github.com/deizeppe/docker-kamailio-500.git && cd docker-kamailio-500
	docker image build -t kamailio .
	
### Run from local
*	docker run -tid --rm --network=host --name=kamailio -v /etc/kamailio:/etc/kamailio kamailio 

### Run from hub
* docker run -tid --rm --network=host --name=kamailio -v /etc/kamailio:/etc/kamailio deizeppe/kamailio 

### Notes
This using default its scripting,to use your custom scripting just `mount` */etc/kamailio* to your path
