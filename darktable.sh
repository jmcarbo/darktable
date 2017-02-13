docker service create --name darktable -p 3389:3389 --with-registry-auth \
	--mount "type=bind,source=/nfs2/docker-swarm/darktable/data,destination=/data" \
	registry.io.imim.cloud/darktable:latest

