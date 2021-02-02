# init swarm
docker swarm init --advertise-addr $1

# dashboard
docker service create \
        --name dashboard \
        --publish 8080:8080/tcp \
        --constraint node.role==manager \
        --mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
        alexellis2/visualizer-arm:latest