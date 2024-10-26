# Week 9: Docker


## Agenda

 * [08:15 – 08:45] – Setting up Docker on your machines
 * [08:45 – 09:00] – Quick intro to Docker
 * [09:15 – 12:00] – Follow-along exercises

## Preparation

For the exercises:

* [Docker: Overview](https://docs.docker.com/get-started/docker-overview/)
* [Docker: Get Docker](https://docs.docker.com/get-started/get-docker/)
* [Docker: Install Docker Engine (can also be done through Docker Desktop)](https://docs.docker.com/engine/install/)
* [Docker: Introduction](https://docs.docker.com/get-started/introduction/)
* [DVC Tutorial](https://dvc.org/doc/use-cases/versioning-data-and-models/tutorial)



## Notes

* No lecture, only follow-along exercises.
* First half-hour dedicated to get Docker working on people's computers
* Timings may change slightly


# Prelude

Before getting started with using Docker, it's a good idea to motivate and explain _what_ Docker actually is so you don't just type commands and see stuff happen.

## Why?
![Works on my machine](https://media.licdn.com/dms/image/v2/D4D12AQErd8DR8mH1HQ/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1690344054617?e=1735171200&v=beta&t=I9ab3xaDdiDDksSkN0bzDAqIW0k-JY_-AsyFxHd7nCs "why docker")

To avoid the above from happening. Or even shorter -- reproducability.

Docker essentially allows running code in an isolated and agnostic way from the operating system, making it crucial for reproducible, automated workflows for both normal DevOps and MLOps.

Itemised list for convenience:

* Reproducible and consistent delivery
* CI/CD pipelines
* Portable and collaborative
* Efficient use of resources

## What?

> [!NOTE]
> Fun fact: Docker is written in Go.

Docker is a way to create a virtual instance of a compute resources. However, unlike virtual machines with their own complete operating system, Docker uses lightweight containers instead.

The key thing is these containers have their own filesystem, dependencies, processes and such, which allows you to run an application in isolation of your operating system.

There are three main components to Docker:

1. Dockerfiles
2. Docker images
3. Docker containers

You will explore each of these components more closely through the upcoming exercises, but a short introduction is in order.

**Dockerfiles** are a set of instructions that will be used to build a **Docker image**. These instructions include information about the *base image* and the *commands* that will be executed (such as installing packages etc).

A **Docker image** is the output from building the **Dockerfile**. They are immutable, but you can build on top of other images by using them as *base images*.

These images can be tagged and versioned, which also makes it easy to roll back and such to other versions. While we will not touch on this too much, you typically also have image repositories that you can push and pull your images to/from ([Docker Hub](https://hub.docker.com/) being the default).

They also have a layered structure where each command/instruction is essentially cached. That means fast and efficient build times when only making changes in parts of the code.

When you want to run the **Docker image**, it spins it up in a **Docker container** as an isolated runtime environment. Once complete, the container shuts down and releases the resources (compute and storage).

Although they are based on the immutable **Docker image**, it is possible to customize the **Docker container** at runtime. This can also be a way to ensure the same environment for *dev* and *prod* work.

But enough theory for now. Let's start with the exercises!




# Exercises

During the exercises, you should 

