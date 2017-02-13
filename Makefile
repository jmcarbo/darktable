build:
	docker build -t jmcarbo/darktable .

run:
	#docker run -ti -p 3389:3389 jmcarbo/darktable /bin/bash
	docker run --rm -ti -p 3389:3389 -e USER_PASSWORD=apassword -v $$PWD/data:/data jmcarbo/darktable 
