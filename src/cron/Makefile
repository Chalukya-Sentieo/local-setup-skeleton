.phony: clean

setup:
	pip install -r requirements.txt

give_permissions:
	chmod +x /run.sh

run: give_permissions
	apk add entr && ls /etc/cron.d/crontab | entr -r /run.sh

run_prod: give_permissions
	/run.sh
