COMPOSE := docker compose -f docker/compose.yaml
RUN     := $(COMPOSE) run --rm dev
export UID := $(shell id -u)
export GID := $(shell id -g)

GEN_MAIN ?= vexsatv.VexSatV
SIM_MAIN ?= vexsatv.VexSatVSim
FW_BIN   ?= fw/build/firmware.bin

.PHONY: all gen fw sim shell build clean

all: gen fw sim

build:
	$(COMPOSE) build

gen: build
	$(RUN) sh -c 'cd hw && sbt "runMain $(GEN_MAIN)"'

fw: build
	$(RUN) make -C fw

sim: build fw
	$(RUN) sh -c 'cd hw && sbt "Test/runMain $(SIM_MAIN) ../$(FW_BIN)"'

shell: build
	$(RUN) bash

clean:
	$(RUN) make -C fw clean || true
	rm -rf gen/* hw/target hw/project/target