SHELL := /bin/bash
.SHELLFLAGS = -ec
.ONESHELL:
.SILENT:

.EXPORT_ALL_VARIABLES:
REPO_DIRECTORY:=$(shell pwd)
AIRFLOW_HOME?=${REPO_DIRECTORY}/airflow
PYTHON_PATH:=$(shell which python)
PIP_BINARY:=$(shell dirname ${PYTHON_PATH})/pip3

.PHONY: help
help:
	echo "❓ Utiliser \`make <target>' où <target> peut être"
	grep -E '^\.PHONY: [a-zA-Z0-9_-]+ .*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = "(: |##)"}; {printf "\033[36m%-30s\033[0m %s\n", $$2, $$3}'

.PHONY: conda-env  ## 🐍 créé l'environnement conda python_indus_avancee, et le récréé s'il existe déjà
conda-env:
	conda create -yqf python=3.8 --name python_indus_avancee

.PHONY: dependences  ## ⏬ installe les dépendances de production
dependences:
	pip install .

.PHONY: dependences-de-test  ## 🧪 installe toutes les dépendances, y compris celles de test
dependences-de-test:
	$(MAKE) dependences & $(PIP_BINARY) install ".[test]"

.PHONY: tests  ## ✅ lance tous les tests
tests:
	$(MAKE) tests-unitaires

.PHONY: tests-unitaires  ## ✅ lance les tests unitaires
tests-unitaires:
	python -m pytest --cov=formation_indus_ds_avancee/ tests/test_unit/ -vv -p no:warnings
