USER=aliquote
HOST=ssh.cluster002.ovh.net
HOST_DIR=www/
LOCAL_DIR=/home/chl/Sites/aliquote/public

clean:
	rm -rf $LOCAL_DIR

build:
	hugo --gc --minify

serve:
	hugo server -D

commit:
	git add .
	git diff-index --quiet HEAD || git commit -m "Publish last build"

deploy: build commit
	git push
	@echo "\033[0;32mDeploying updates to $(HOST)...\033[0m"
	# rsync -v -rz --checksum --delete --no-perms $(PUBLIC_DIR) ${USER}@${HOST}:~/${HOST_DIR}
	rsync -az ${LOCAL_DIR}/ ${USER}@${HOST}:~/${HOST_DIR}

