ifneq (,)
	.error This Makefile requires GNU Make.
endif

.PHONY: run

run:
	@ansible-playbook --inventory=inventory.yaml main.yaml

lint: yaml-lint ansible-lint

yaml-lint:
	@docker run --rm $(shell tty -s && echo "-it" || echo) -v "$(shell pwd):/data" cytopia/yamllint:latest .

ansible-lint:
	@docker run --rm $(shell tty -s && echo "-it" || echo) -v "$(shell pwd):/data" -w /data quay.io/ansible/toolset:latest ansible-lint *.yaml

