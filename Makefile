SRC_PATH := $(shell pwd)
TEST_PATH := ${SRC_PATH}/example/

define HELP
This is the Netlify Identity Modal project Makefile.

Usage:

make install         - Install NPM dependencies of project and demo.
make build           - Create build suitable for production.
make clean           - Purge dependencies & lock files.
make test            - Run unit tests.
make update          - Update project & demo dependencies.

endef
export HELP

.PHONY: install build clean update test help

all help:
	@echo "$$HELP"

.PHONY: install
install:
	echo "Installing project dependencies..."
	cd ${SRC_PATH}
	yarn
	echo "Installing test/demo dependencies..."
	cd "${TEST_PATH}"
	yarn
	cd ${SRC_PATH}

.PHONY: build
build:
	yarn build

.PHONY: test
test:
	yarn test

.PHONY: clean
clean:
	rm -rf './node_modules' -delete
	rm -rf './dist' -delete
	rm -rf './example/node_modules' -delete
	find . -name 'package-lock.json' -delete
	find . -name 'yarn.lock' -delete
	find . -name '.pnp.cjs' -delete
	find . -wholename '**/.yarn' -delete
	find . -wholename '*/*.log' -delete
	find . -wholename 'public' -delete

.PHONY: update
update:
	echo "Updating test/demo dependencies..."
	cd "${TEST_PATH}"
	yarn upgrade
	echo "Updating main project dependencies..."
	cd ${SRC_PATH}
	yarn upgrade
