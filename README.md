# docker-kamailio-500

**Build and run kamailio on docker*

Pull from hub

docker pull deizeppe/kamailio
Build from source

git clone https://github.com/deizeppe/docker-kamailio-500.git && cd docker-kamailio
docker image build -t kamailio .
Run from local

docker run -tid --rm --network=host --name=kamailio -v /etc/kamailio:/etc/kamailio kamailio
Run from hub

docker run -tid --rm --network=host --name=kamailio -v /etc/kamailio:/etc/kamailio mich43l/kamailio
Notes

This using default its scripting,to use your custom scripting just mount /etc/kamailio to your path
