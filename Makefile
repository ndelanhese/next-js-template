# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Colors definitions                                                          │
# └─────────────────────────────────────────────────────────────────────────────┘
CR=\033[0;31m
CG=\033[0;32m
CY=\033[0;33m
CB=\033[0;36m
RC=\033[0m

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Commands                                                                    │
# └─────────────────────────────────────────────────────────────────────────────┘
.PHONY: build
build:
	@docker rm next-app 2>/dev/null || true
	@docker rmi next-app_image 2>/dev/null || true
	@docker build . -t next-app_image
	@docker create --name next-app -p 3001:3000 next-app_image

.PHONY: stop
stop:
	@docker stop next-app

.PHONY: sh
sh:
	@docker exec -it next-app sh

.PHONY: start
start:
	@docker start next-app

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Help                                                                        │
# └─────────────────────────────────────────────────────────────────────────────┘
help:
	@echo ""
	@echo -e "${CY}Usage:${RC}"
	@echo -e "   make ${CG}<command>${RC}"
	@echo ""
	@echo -e "${CY}Infra commands:${RC}"
	@echo -e "${CG}   build               ${RC}Build all containers"
	@echo -e "${CG}   start               ${RC}Start all containers"
	@echo -e "${CG}   stop                ${RC}Stop all containers"
	@echo -e "${CG}   sh                  ${RC}Enter inside a container"
	@echo ""