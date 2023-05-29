# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seozcan <seozcan@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/24 14:32:18 by seozcan           #+#    #+#              #
#    Updated: 2023/05/29 21:21:56 by seozcan          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@sudo mkdir -p /home/$$USERNAME/data/mariadb /home/$$USERNAME/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

install :
	@sudo apt-get update 
	@sudo apt-get upgrade -y
	@sudo apt-get install -y curl gnupg ca-certificates lsb-release docker.io docker docker-compose
	@sudo mkdir -p /home/$$USERNAME/data/mariadb /home/$$USERNAME/data/wordpress 
	
restart :
	@docker-compose -f ./srcs/docker-compose.yml stop
	@docker-compose -f ./srcs/docker-compose.yml start

down:
	@docker-compose -f ./srcs/docker-compose.yml down

stop:
	@docker stop $$(docker ps -q)

fclean:
	@docker stop $$(docker ps -qa)
	@docker rm $$(docker ps -qa)
	@docker rmi -f $$(docker images -qa)
	@docker volume rm $$(docker volume ls -q)
	@docker network $$(docker network ls -q)

re: clean all

.PHONY: all clean fclean re
