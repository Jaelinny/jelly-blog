#!/bin/bash

figlet -f bubble start

# rm & rmi
figlet remove all
sudo docker stop $(sudo docker ps -q)
sudo docker rm $(sudo docker ps -a -q)
sudo docker rmi $(sudo docker images -q)
sudo docker network rm blog-net

# build 
figlet build lb
sudo docker build -t taengguu/auto-lb:0.1.0 -f Dockerfile .

# run
figlet run lb
sudo docker run -d --name taengguu -p 9999:80 taengguu/auto-lb:0.1.0

# network
figlet network blog-net
sudo docker network create blog-net
sudo docker network connect blog-net taengguu
sudo docker network inspect blog-net

figlet ps
sudo docker ps

#sl -aF
