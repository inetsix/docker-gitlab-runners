restart: stop start
reload: down up

up:
		@echo "======================================================================"
		@echo "Build image, load variables, register runners"
		@echo "======================================================================"
		docker-compose -f ./docker-compose.yml up -d
		sh build.sh
		sh runner-register.sh

down:
		@echo "======================================================================"
		@echo "Stop runners, unregister and delete containers"
		@echo "======================================================================"
		sh runner-unregister.sh
		docker-compose -f ./docker-compose.yml down


start:
		@echo "======================================================================"
		@echo "Start runners"
		@echo "======================================================================"
		docker-compose -f ./docker-compose.yml start

stop:
		@echo "======================================================================"
		@echo "Stop runners"
		@echo "======================================================================"
		docker-compose -f ./docker-compose.yml stop

register:
		@echo "======================================================================"
		@echo "Register runners"
		@echo "======================================================================"
		sh build.sh
		sh runner-register.sh

unregister:
		@echo "======================================================================"
		@echo "Stop runners, unregister and delete containers"
		@echo "======================================================================"
		sh runner-unregister.sh

ps:
		@echo "======================================================================"
		@echo "Runners status"
		@echo "======================================================================"
		docker-compose -f ./docker-compose.yml ps
