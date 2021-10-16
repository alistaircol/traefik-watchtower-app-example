Just messing around with watchtower and an 'application' image with traefik.

## setting up

We only care about three things here, other services are illustration purposes only:

* http://app.poc.ac93.uk - simple app that we will CD
* http://watchtower.poc.ac93.uk - we will send a webhook when our docker image is built to re-deploy it
* local.registry.ac93.uk:5000 - pushing the above app image

```bash
sudo tee -a /etc/hosts > /dev/null <<EOF
127.0.0.1 local.registry.ac93.uk
127.0.0.1 watchtower.poc.ac93.uk
127.0.0.1 traefik.poc.ac93.uk
127.0.0.1 app.poc.ac93.uk
127.0.0.1 ip.pox.ac93.uk
EOF
```

## running a private local registry

`watchtower` [can't monitor local images](https://github.com/containrrr/watchtower/issues/416#issuecomment-568896089) so we need to push them to a registry.

Starting the registry:

```bash
make registry
```

You will need to update `watchtower-config.json` as discussed [here](https://containrrr.dev/watchtower/private-registries/) to deal with private registries.

## build initial image

Just a caddy SPA app:

```bash
make image
```

Push to registry:

```bash
make push
```

Check interpolation if you want to change stuff (shouldn't need to):

```bash
docker-compose config
```

## starting

```bash
docker-compose up
xdg-open 'http://app.poc.ac93.uk'
```

## testing

Go to `http://app.poc.ac93.uk`

```bash
xdg-open 'http://app.poc.ac93.uk'
```

Make a change to `html/index.html` and re-build image, wait a minute (poll interview of watchtower) and refresh

```bash
make image
make push
```

![screenshot](https://raw.githubusercontent.com/alistaircol/traefik-watchtower-app-example/main/.github/screenshot.png)
