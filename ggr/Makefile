.ONESHELL:
.SHELL := /usr/bin/bash
.PHONY: apply-test-plan clean destroy fmt graph inputs test-plan update-readme validate

export TF_IN_AUTOMATION=1
export TF_INPUT=0

fmt:
	@terraform fmt -recursive

validate: fmt
	@test -f secrets.env && . ./secrets.env || true
	@cd test
	@terraform init -backend=false -lock=false
	@terraform validate

test-plan: validate
	@test -f secrets.env && . ./secrets.env || true
	@cd test
	@terraform init
	@terraform plan -out=plan.tfplan

apply-test-plan:
	@test -f secrets.env && . ./secrets.env || true
	@cd test
	@terraform apply -refresh=false plan.tfplan
	@rm -f plan.tfplan

destroy:
	@test -f secrets.env && . ./secrets.env || true
	@cd test
	@terraform plan -destroy -out=plan.tfplan
	@terraform apply -refresh=false plan.tfplan
	@rm -f plan.tfplan

providers:
	@cd test
	@terraform providers

graph:
	@cd test
	@terraform graph

inputs:
	@terraform-docs pretty . \
		--no-providers \
		--no-outputs \
		--sort-by-required

update-readme:
	@test -f README.backup.md \
		&& echo Delete backup before updating README.md \
		&& exit 42 \
		|| cp README.md README.backup.md
	@sed -n '/## Providers/q;p' README.backup.md > README.md
	@terraform-docs md . >> README.md

clean: fmt
	@find . -depth -type d -a '(' \
		-name '.terraform' \
		-o \
		-name '*.backup' \
	')' -exec rm -rf '{}' +
	@find . -depth -type f -a '(' \
		-name '*.log' \
		-o \
		-name '*.tfstate' \
		-o \
		-name '*.tfstate.*' \
		-o \
		-name '*.tfplan' \
		-o \
		-name '*.backup' \
		-o \
		-name '*.backup.md' \
	')' -exec rm -rf '{}' +
