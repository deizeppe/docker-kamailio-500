# Kamailio on docker
![ver](https://img.shields.io/github/v/release/deizeppe/docker-kamailio-500?color=red&style=plastic)
![License](https://img.shields.io/github/license/deizeppe/docker-kamailio-500?color=yellow&style=plastic)
![reposize](https://img.shields.io/github/repo-size/deizeppe/docker-kamailio-500?color=orange&style=plastic)


Build and run kamailio on docker


### Pull an image or a repository from a registry
	docker pull deizeppe/kamailio

### Build an image from a Dockerfile
	git clone https://github.com/deizeppe/docker-kamailio-500.git && cd docker-kamailio-500
	docker image build -t kamailio .
	
### Run from local
* docker run -tid --rm --network=host --name=kamailio -v /etc/kamailio:/etc/kamailio kamailio 

### Run from hub
* docker run -tid --rm --network=host --name=kamailio -v /etc/kamailio:/etc/kamailio deizeppe/kamailio 

### Notes
This using default its scripting,to use your custom scripting just `mount` */etc/kamailio* to your path
