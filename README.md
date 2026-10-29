
# Ubuntu Server Infrastructure & Docker Lab

## Project Overview

A hands-on Linux system administration and containerization lab built using an Ubuntu Server virtual machine.

This project demonstrates server configuration, network security, Bash automation, Docker deployment, application lifecycle management, persistent storage, and disaster recovery.

## Technologies Used

- Ubuntu Server
- Linux CLI and SSH
- UFW Firewall
- Nginx
- Docker Engine and Docker Compose
- Bash scripting
- systemd services and timers
- tar and curl

## Infrastructure and System Administration

Configured an Ubuntu Server VM for remote administration and web hosting.

- Enabled SSH for remote administration.
- Configured UFW rules for SSH and HTTP.
- Installed and managed Nginx using systemd.
- Troubleshot service configuration and file permissions.
- Created Bash-based system health monitoring.
- Scheduled monitoring using systemd timers.
- Implemented automated website backups with verification and seven-backup retention.

## Docker Containerization

Deployed Nginx using Docker and created a custom Docker image containing an HTML website.

Key activities:
- Built custom images using a Dockerfile.
- Configured localhost-bound port mappings.
- Inspected container logs and resource usage.
- Configured container restart policies.
- Practiced stopping, restarting, and troubleshooting containers.

## Application Deployment and Rollback

Built two versions of a containerized website:

- `soc-web:v1` — Original application.
- `soc-web:v2` — Updated application.

Deployed and validated v2, then restored v1 to simulate an application rollback.

## Docker Compose

Created Compose configurations for repeatable deployment.

- Defined services and port mappings in YAML.
- Built and deployed a custom Nginx application.
- Managed container lifecycle using Compose commands.
- Used Compose-managed Docker networks and named volumes.

## Persistent Storage and Disaster Recovery

Implemented persistent storage using Docker named volumes.

Validated that data survived container deletion and recreation.

Performed a recovery exercise:
1. Backed up a Docker volume to a compressed tar archive.
2. Inspected archive contents and checked gzip integrity.
3. Restored the archive into a separate Docker volume.
4. Launched an Nginx container using the recovered data.
5. Verified file recovery and successful HTTP responses.

## Repository Structure

```text
ubuntu-server-docker-lab/
├── docker-web/
│   ├── Dockerfile
│   ├── index.html
│   └── compose.yaml
├── storage-compose/
│   └── compose.yaml
└── README.md
```

## Running the Custom Website

Requires Docker Engine and Docker Compose.

```bash
cd docker-web
docker compose up -d --build
curl http://localhost:8083
```

The website is bound to localhost on port 8083.

To stop the application:

```bash
docker compose down
```

## Running the Storage Lab

```bash
cd storage-compose
docker compose up -d
```

The storage example uses port 8085 and a named volume to preserve website files across container recreation.

## Skills Demonstrated

Linux administration, SSH, firewalls, web servers, shell scripting, system monitoring, containerization, networking, deployment, rollback, persistent storage, backup verification, and recovery testing.

## Future Improvements

- Automate Docker volume backups.
- Add container health checks.
- Introduce centralized monitoring.
- Expand the environment with additional services.
