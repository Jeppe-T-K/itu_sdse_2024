# Week 9: Docker


## Agenda

 * [08:15 – 08:45] – Setting up Docker on your machines
 * [08:45 – 09:00] – Quick intro to Docker
 * [09:15 – 12:00] – Follow-along exercises

## Preparation

For the exercises:

* [Docker: Overview](https://docs.docker.com/get-started/docker-overview/)
* [Docker: Concepts (basics and building images + containers)](https://docs.docker.com/get-started/docker-concepts/the-basics/what-is-a-container/)
  * Skip the following sections 
    * *The basics -- What is Docker Compose?*
    * *Building images -- Understanding the image layers*
    * *Building images -- Multi-stage builds*
    * *Running containers -- Multi-container applications*
* [Docker: Get Docker](https://docs.docker.com/get-started/get-docker/)
* [Docker: Install Docker Engine (can also be done through Docker Desktop)](https://docs.docker.com/engine/install/)
* [Docker: Introduction](https://docs.docker.com/get-started/introduction/)


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

> [!NOTE]
> **Learning outcomes**
> <i> By the end of the exercises, we expect you to be able to do the following:</i>
> <ul>
> <li>Write/create a basic Dockerfile that can run a basic DS project [e.g., CCDS]</li>
> <li>Explain the workflow and processes for using Docker</li>
> <li>Motivate the typical ways you can modify Docker containers at runtime</li>
> </ul>

As described in the previous section, Docker is really a way to run code in a reproducible way.

## Exercise 0: Installation



1. <details> <summary> Install Docker Desktop+Engine</summary>
   If you haven't already, you need to make sure to install <a href="https://docs.docker.com/engine/install/">Docker Engine</a>. The easiest way is to do it through <a href="https://docs.docker.com/desktop/">Docker Desktop</a>. For Windows users, you will also need to install <a href="https://learn.microsoft.com/en-us/windows/wsl/install">WSL</a> if you haven't already.
   </details>
2. <details> <summary> Test your Docker installation is working</summary>
   In the terminal, run <code>docker run hello-world</code>

   If it works, great! If not, try googling the issue.

   A common issue is that the Docker daemon not running. If you installed it with Docker Desktop, make sure that program is running.
   </details>

## Exercise 1: Create a training Dockerfile

<!-- Example details text
1. <details> <summary> Exercise summary </summary>
   Exercise description
   </details>
-->

1. <details> <summary> Build out our CCDS repo with a train.py script </summary>
   Exercise description
   </details>
2. <details> <summary> Create train.dockerfiler </summary>
   Exercise description
   </details>
3. <details> <summary> Find appropiate base-image </summary>
   Exercise description
   </details>
4. <details> <summary> Modify example Dockerfile to fit our use-case</summary>
   Inspired from <a href="https://docs.docker.com/get-started/docker-concepts/building-images/writing-a-dockerfile/">this website:</a>

   <pre><code>
   FROM python:3.12
   WORKDIR /usr/local/app
   # Install the application dependencies
   COPY requirements.txt ./
   RUN pip install --no-cache-dir -r requirements.txt
   # Copy in the source code
   COPY src ./src
   EXPOSE 5000
   # Setup an app user so the container doesn't run as the root user
   RUN useradd app
   USER app
   CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
   </code></pre>
   </details>

## Exercise 2: Build the image

1. <details> <summary> Build the train.dockerfile </summary>
   Exercise description
   </details>

2. <details> <summary> Add version/tag </summary>
   Exercise description
   </details>

3. <details> <summary> Modify a file (e.g., requirements.txt) </summary>
   Exercise description
   </details>

## Exercise 3: Run your image

1. <details> <summary> Run your latest image </summary>
   Exercise description
   </details>

2. <details> <summary> Try different arguments </summary>
   -i

   -d

   -p

   -v

   -e
   </details>

3. <details> <summary> Check running containers </summary>
   <code>docker ps</code>
   </details>

## Exercise 4: Push and pull

1. <details><summary> Find an interesting <a href="https://hub.docker.com/search?categories=Machine+Learning+%26+AI">AI/ML image</a> and pull it</summary>
   <code>docker pull jupyter/scipy-notebook</code>

   Or run it directly:
   <code>docker run jupyter/scipy-notebook</code>

   Suggested arguments: -p 10000:8888 -d
   </details>


## Exercise 5: Clean up

1. <details> <summary>Check local images</summary>
   <code>docker images</code>
   </details>

2. <details> <summary>Remove images</summary>
   <code>docker rmi IMAGEID</code>
   </details>
