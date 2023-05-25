# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seozcan <seozcan@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/24 14:32:18 by seozcan           #+#    #+#              #
#    Updated: 2023/05/25 18:03:52 by seozcan          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@sudo mkdir -p /home/semiha/data/mariadb /home/semiha/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

install :
	@sudo apt-get update 
	@sudo apt-get upgrade -y
	@sudo apt-get install -y curl gnupg ca-certificates lsb-release docker.io docker docker-compose
	@sudo mkdir -p /home/semiha/data/mariadb /home/semiha/data/wordpress 
	
restart :
	@docker-compose -f ./srcs/docker-compose.yml stop
	@docker-compose -f ./srcs/docker-compose.yml start

down:
	@docker-compose -f ./srcs/docker-compose.yml down

stop:
	@docker stop $$(docker ps -q)

clean:
	@docker rm -f $$(docker ps -qa)
	@docker image rm -f $$(docker image ls -q)
	@docker volume rm -f $$(docker volume ls)
	@docker network prune

re: clean all

.PHONY: all clean fclean re
