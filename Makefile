# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seozcan <seozcan@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/24 14:32:18 by seozcan           #+#    #+#              #
#    Updated: 2024/02/07 16:03:37 by seozcan          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

HOME 		= $(shell echo $$HOME)

all:
	@mkdir -p $(HOME)/data/mariadb $(HOME)/data/wordpress
	@docker-compose -f ./src/docker-compose.yml up --build -d 

install :
	@sudo apt-get update 
	@sudo apt-get upgrade -y
	@sudo apt-get install -y curl gnupg ca-certificates lsb-release docker.io docker docker-compose
	@sudo mkdir -p $(HOME)/data/mariadb $(HOME)/data/wordpress 
	
restart :
	@docker-compose -f ./src/docker-compose.yml stop
	@docker-compose -f ./src/docker-compose.yml start

down:
	@docker-compose -f ./src/docker-compose.yml down

fclean: down
	@docker rm -f $(shell docker ps -qa) || true
	@docker system prune -af
	@docker volume rm $(shell docker volume ls -q) || true
	@rm -rf $(HOME)/data/*

re: fclean all

.PHONY: all clean fclean re
