# Containers All The Way Down


Talk about building blocks of modern containers
(from chroot to AuFS). Introduction to Docker with Ruby+Redis
container examples, and docker-compose workflow.

Significant part of this one is the practical examples:

1. *chroot* - show how to use chroot to run a simple app (e.g. bash)
in it, discuss briefly requirements to make various resources (e.g.
virtual filesystems) available inside chroot.

2. *AuFS* - demo layering, and how files from later branches overwrite earlier
ones. Show an example with an empty writeable top-level layer, that acts
as a "scratch" layer to keep ones below it immutable, and can be discarded
to go back to unchanged files.

3. *Dockerfile* - write a Dockerfile (example in the repo) to run Clickme app.
Discuss layers in the context of docker container, port mapping, linking
containers together. Run redis, demo environment variables injected by docker
for linked containers. Pay attention to how layers are organised, make parallels
with the earlier AuFS demo.

4. *docker-compose.yml* - demonstrate automation of the previous Ruby+Redis
container setup with a simple compose file (example in the repo).
