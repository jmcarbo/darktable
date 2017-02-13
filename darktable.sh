docker service create --name darktable -p 3389:3389 \
	--mount "type=bind,source=/nfs2/docker-swarm/darktable/data,destination=/data" \
	jmcarbo/darktable:latest

