USER=aliquote
HOST=ssh.cluster002.ovh.net
HOST_DIR=www/
LOCAL_DIR=/home/chl/Sites/aliquote/public

.PHONY: build commit deploy

clean:
	rm -rf $LOCAL_DIR

build:
	@echo "\033[0;32m[+] Building public files in $(LOCAL_DIR)\033[0m"
	hugo --gc --minify

serve:
	hugo server -D

commit:
	@echo "\033[0;32m[+] Staging local changes\033[0m"
	git add .
	git diff-index --quiet HEAD || git commit -m "Publish last build"

deploy: build commit
	@echo "\033[0;32m[+] Syncing on GitHub\033[0m"
	git push
	@echo "\033[0;32m[+] Deploying updates to $(HOST)\033[0m"
	rsync -az ${LOCAL_DIR}/ ${USER}@${HOST}:~/${HOST_DIR}

