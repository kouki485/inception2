all: start

# 起動
start:  make-volume-dir
	docker-compose -f ./srcs/docker-compose.yml up -d

# 停止
stop:
	docker-compose -f ./srcs/docker-compose.yml stop

# 再ビルド
re: rebuild
rebuild: down build start

down:
	-docker stop $(docker ps -qa)
	-docker rm $(docker ps -qa)
	-docker rmi -f $(docker images -qa)
	-docker volume rm $(docker volume ls -q)
	-docker network rm $(docker network ls -q)
	-docker-compose -f ./srcs/docker-compose.yml down
	make remove-volume

add-host:
	sudo echo '127.0.0.1 username.42.fr' >> /etc/hosts

# ポートが重複しがちなサービスの終了
stop-service:
	sudo service nginx stop
	sudo service mysql stop

make-volume-dir:
	sudo mkdir -p /home/username/data/wordpress
	sudo mkdir -p /home/username/data/mysql

remove-volume:
	sudo rm -rf /home/username/data/mysql/* /home/username/data/wordpress/*

build:
	- docker-compose -f ./srcs/docker-compose.yml down --volumes --rmi all
	- docker-compose -f ./srcs/docker-compose.yml build --no-cache

.PHONY: all start stop rebuild add-host stop-service make-volume-dir remove  n-volume build re
