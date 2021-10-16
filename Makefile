lint:
	@docker run --rm $(shell tty -s && echo "-it" || echo) \
		-v "$(shell pwd):/data" \
		cytopia/yamllint:latest .

registry:
	@docker run --rm \
      -p 5000:5000 \
      --name=alistaircol_registry \
      registry:2.7

registry = local.registry.ac93.uk:5000
image = alistaircol/ac93-app

image : date = $(shell date +"%Y-%m-%d_%H%S")
image:
	@docker build --force-rm \
       --tag $(image):$(date) \
       --tag $(image):latest \
       .
	@docker tag $(image):$(date) $(registry)/$(image):$(date)
	@docker tag $(image):latest $(registry)/$(image):latest

token = 6Zet8EN8yaZFz42A84xcKDdwRMvGmw7L
push:
	@docker push --all-tags $(registry)/$(image)
	@curl -H "Authorization: Bearer $(token)" http://watchtower.poc.ac93.uk/v1/update
