PIP_COMPILE_ARGS = --upgrade --no-emit-index-url --no-emit-trusted-host
TEST_OPTS ?=

help:
	@echo  "usage: make [TARGET]"
	@echo  "Targets:"
	@echo  "   init         	Install dependencies and ensure they are synced"
	@echo  "   test            Runs all tests and charts_check"
	@echo  "   update          Compiles and updates dependencies"

update:
	CUSTOM_COMPILE_COMMAND="make update" pip-compile $(PIP_COMPILE_ARGS) requirements.in
	CUSTOM_COMPILE_COMMAND="make update" pip-compile $(PIP_COMPILE_ARGS) dev-requirements.in
	CUSTOM_COMPILE_COMMAND="make update" pip-compile $(PIP_COMPILE_ARGS) tests/requirements.in

init:
	@which pip-sync > /dev/null || pip install -q pip-tools
	pip-sync requirements.txt dev-requirements.txt tests/requirements.txt
	pip install --no-deps --no-index -e .

test: deps
	./scripts/test.sh $(TEST_OPTS)

.PHONY: help init test
