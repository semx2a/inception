# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seozcan <seozcan@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/24 14:32:18 by seozcan           #+#    #+#              #
#    Updated: 2023/05/31 13:34:00 by seozcan          ###   ########.fr        #
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

fclean: down
	@docker rm -f $$(docker ps -qa) || true
	@docker image rm $$(docker image ls -qa) || true
	@docker volume rm $$(docker volume ls -q) || true
	@docker network rm $$(docker network ls -q) || true
	@sudo rm -rf /home/$$USERNAME/data/*

re: fclean all

.PHONY: all clean fclean re
