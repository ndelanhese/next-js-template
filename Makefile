# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Commands                                                                    │
# └─────────────────────────────────────────────────────────────────────────────┘
.PHONY: build
build:
	@cd .docker/bin; bash build.sh

.PHONY: exec
exec:
	@cd .docker/bin; bash exec.sh

.PHONY: latest
latest:
	@cd .docker/bin; bash latest.sh

.PHONY: next
next:
	@cd .docker/bin; bash next.sh

.PHONY: rollback
rollback:
	@cd .docker/bin; bash rollback.sh

.PHONY: start
start:
	@cd .docker/bin; bash start.sh

.PHONY: stop
stop:
	@cd .docker/bin; bash stop.sh

.PHONY: remove
remove:
	@cd .docker/bin; bash remove.sh $(BUILD_ID)

# ┌─────────────────────────────────────────────────────────────────────────────┐
# │ Help                                                                        │
# └─────────────────────────────────────────────────────────────────────────────┘
help:
	@echo ""
	@echo "Usage:"
	@echo "    make <command>"
	@echo ""
	@echo "Infra commands:"
	@echo "    build               Build new image and creates a new container."
	@echo "    exec                Enter in current container."
	@echo "    latest              Starts container based on latest build."
	@echo "    next                Starts next container."
	@echo "    rollback            Reverts to the last valid container."
	@echo "    start               Starts current container."
	@echo "    stop                Stops current container."
	@echo "    remove              Remove current container."
	@echo ""
