.PHONY: clean

setup: clean
	pip install -r requirements.txt

run:
	apk add entr && find . -type f -name "*.py" -o -name "*.txt" | entr -r /run.sh;

run_prod:
	gunicorn server:app
