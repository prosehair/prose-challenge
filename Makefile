all: help


init:  ## Create and initialize a local virtual env (eg. code completion, ...)
	rm -rf venv
	python3 -m venv venv
	./venv/bin/pip install -r requirements.txt


run:  ## Run the app in debug mode
	docker-compose run --rm --service-ports app python3 -m pdb manage.py runserver 0.0.0.0:8000


shell:  ## Start a shell in the app container
	docker-compose run --rm --service-port app bash


clean:  ## Cleanup temporary files
	find . -name '*.pyc' -delete
	find . -name '__pycache__' -delete


clean-all: clean  # Clean up temporary files and environment
	rm -rf venv


help:  ## Show commands help.
	@grep -E "^[^._][a-zA-Z_-]*:" Makefile | awk -F '[:#]' '{print $$1, ":", $$NF}' | sort | column -t -s:


.SILENT: clean clean-all venv run shell help
.PHONY: clean clean-all venv run shell help
