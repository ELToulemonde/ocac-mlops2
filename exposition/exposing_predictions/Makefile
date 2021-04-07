SHELL := /bin/bash
.SHELLFLAGS = -ec
.ONESHELL:
.SILENT:

.PHONY: help
help:
	echo "❓ Utiliser \`make <target>' où <target> peut être"
	grep -E '^\.PHONY: [a-zA-Z0-9_-]+ .*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = "(: |##)"}; {printf "\033[36m%-30s\033[0m %s\n", $$2, $$3}'

.PHONY: server  ## 🐍 lance l'application streamlit
server:
	streamlit run display_predictions.py

.PHONY: docker-build  ## 🐳 pour builder l'image docker
docker-build:
	docker build -t exposing-predictions-app:v1 .

.PHONY: docker-server  ## 🐳 pour lancer l'application streamlit dans docker
docker-server:
	docker run --rm -p 8090:8090 --name exposing-predictions -it exposing-predictions-app:v1
