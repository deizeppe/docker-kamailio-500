# docker-kamailio-500
![License](https://img.shields.io/github/license/deizeppe/docker-kamailio-500?color=purple&style=plastic)
![reposize](https://img.shields.io/github/repo-size/deizeppe/docker-kamailio?color=orange&style=plastic)
![dockerbuild](https://img.shields.io/docker/automated/deizeppe/kamailio?style=plastic)

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
