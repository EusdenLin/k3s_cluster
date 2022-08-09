#! /bin/bash

echo -e "set up links"
sudo ip link add h1R1veth type veth peer name R1h1veth
sudo ip link set R1h1veth netns $(docker inspect -f {{.State.Pid}} R1)
sudo ip link set h1R1veth netns $(docker inspect -f {{.State.Pid}} h1)

echo -e "set ip address"
docker exec R1 ip addr add 192.168.1.1/24 dev R1h1veth
docker exec h1 ip addr add 192.168.1.100/24 dev h1R1veth
docker exec R1 ip link set R1h1veth up
docker exec h1 ip link set h1R1veth up


