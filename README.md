# Docker Compose Deployments
On this repo, are the deployement files for various applications I self-host. \

## Project structure
This project follows the base/overlay structure. \
Base configuration is stored in the `base` directory, and isn't meant to be changed. \
The docker-compose files for each services are stored in the `overlay` directory. \
The `overlay` contains folders for multiple stack deployements. \
Each docker compose imports the base compose file and apply override values on it for each deployment. \

## Creating a deployment
To create a deployment, copy the corresponding deployement in example overlay.
```bash
mkdir -p overlay/my_stack
```
```bash
cp -r overlay/example/someapp overlay/my_stack/someapp
```
```bash
mv overlay/my_stack/someapp/override.env.sample overlay/my_stack/someapp/override.env
```

Then edit the deployement overlay files, you can also add other ressources such as labels for caddy-docker-proxy for example.
```bash
vim overlay/my_stack/someapp/docker-compose.yml
```
```bash
vim overlay/my_stack/someapp/override.env
```

Finally, deploy your app
```bash
cd overlay/my_stack/someapp
docker compose up -d
```

If you need to install docker, you can use this command
```bash
curl -fsSL https://get.docker.com | sh
```
