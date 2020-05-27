# Ansible Tutorial

A basic Django app with postgres as database deployed on DigitalOcean (droplet) via Ansible.

## Environment variables

Create a `.env` file in the root of the cloned repository, with following variables:

```bash
POSTGRES_DB=sample
POSTGRES_USER=postgres
POSTGRES_PASSWORD="set strong password for postgres"
SUPERUSER_PASSWORD="set strong password for django admin dashboard"
DO_API_TOKEN="Digital Ocean token, if deploying"
```

## Running the app

To run the app install `docker` and `docker-compose`. Build and run the
app with following commands:

```bash
docker-compose build
```

```bash
docker-compose up
```

After running the commands above, the app should be running at:
http://127.0.0.1:8000/

## Deployment

This is deployed on Digital Ocean Droplet via Ansible. To deploy run the
following command after `docker-compose up`:

```bash
docker-compose exec web ansible-playbook deployment/site.yml
```
