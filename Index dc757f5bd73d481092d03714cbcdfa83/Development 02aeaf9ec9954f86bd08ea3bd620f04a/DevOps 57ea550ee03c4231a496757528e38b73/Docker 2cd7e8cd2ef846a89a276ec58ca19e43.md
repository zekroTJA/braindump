# Docker

[Example Dockerfiles](Docker%202cd7e8cd2ef846a89a276ec58ca19e43/Example%20Dockerfiles%20beae9d0ac68741339b19dd6a8a338aa7.md)

[Address Pool Configuration](Docker%202cd7e8cd2ef846a89a276ec58ca19e43/Address%20Pool%20Configuration%2000916a574df8450ab26914413ed92719.md)

# What is this?

> **Docker** is a set of [platform as a service](https://en.wikipedia.org/wiki/Platform_as_a_service) (PaaS) products that use [OS-level virtualization](https://en.wikipedia.org/wiki/OS-level_virtualization) to deliver software in packages called *[containers](https://en.wikipedia.org/wiki/Container_(virtualization))*.[[5]](https://en.wikipedia.org/wiki/Docker_(software)#cite_note-SYS-CON_Media-5) 
The service has both free and premium tiers. The software that hosts the containers is called **Docker Engine**. It was first started in 2013 and is developed by [Docker, Inc](https://en.wikipedia.org/wiki/Docker,_Inc.).
> 

Source: [https://en.wikipedia.org/wiki/Docker_(software)](https://en.wikipedia.org/wiki/Docker_(software))

# Useful Tools around Docker

## [Docker Compose](https://docs.docker.com/compose/)

A tool to define Docker images in a simple `docker-compose.yml` file and to simply manage multiple containers, volumes and networks in one stack.

### Links

- Project: https://github.com/docker/compose
- Docs: [https://docs.docker.com/compose/](https://docs.docker.com/compose/)
- Compose File Reference: [https://docs.docker.com/compose/compose-file/](https://docs.docker.com/compose/compose-file/)

## [gVisor](https://github.com/google/gvisor)

An application kernel for Docker that abstracts the underlying Linux system kernel to provide better security and isolation for containers.

### Links

- Project: https://github.com/google/gvisor
- Docs: [https://gvisor.dev/docs/](https://gvisor.dev/docs/)
- Used in: [https://github.com/ranna-go](https://github.com/ranna-go/)