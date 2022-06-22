.phony: clean

setup:
	pip install -r requirements.txt

run:
	apk add entr && $(ls /etc/cron.d/crontab | entr -r crontab /etc/cron.d/crontab)& crond -f -d 10

run_prod:
	crond -f -d 10
