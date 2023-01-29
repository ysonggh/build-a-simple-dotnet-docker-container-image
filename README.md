# Overview
This repository is to build a C#-based Hello World .NET Core Web Application Docker Image with .NET7.0

# Environment Setup
Make sure you have installed Docker(https://docs.docker.com/desktop/), dotnet core sdk and asp.net runtime (https://dotnet.microsoft.com/en-us/download) on your machine.

# Steps to create a docker image and build a container
## Step 1: Create a simple .net web app
1. In your terminal, navigate the working directory to this repository (build-a-simple-dotnet-docker-container-image). 
2. In your terminal, run cmd `dotnet new webapp -o MyWebApp --no-https -f net7.0` to create a simple .net hello-world web application.
3. In your terminal, run cmd `dotnet build ./MyWebApp` to build your web app.
4. In your terminal, run cmd `dotnet run --project ./MyWebApp` to run your web app. To test it, open a new terminal, run cmd `curl http://localhost:<port-number>` to check whether the app is accessible. `Ctrl + c` to exit the app.

## Step 2: Publish a local build of your web app (This is what will be copied into the container)
In your terminal, run cmd `dotnet publish -c Release ./MyWebApp`

## Step 3: Build the container image and tag it (Make sure the Dockerfile is ready)
In your terminal, run cmd `docker build -t mywebappimage:v1 .`
Note: 
- The Dockerfile and config.sh files can be find in main directory of this repository.
- You can always list all docker container images via cmd `docker images` to see whether the `mywebappimage` image is created successfully.
- To delete the image and build cache, please run cmd: `docker rmi mywebappimage:v1` `docker builder prune --force` `docker image prune --force`
- If you can't see config.sh output in terminal while building the container, please delete the image and build cache, and run cmd `docker build --progress plain -t webappimage:v1 .` to build the container with progress plan to see config command.

## Step 4:  Run the container based on the image locally and test it out
In your terminal, run cmd `docker run --name mywebapp --publish 8080:80 --detach mywebappimage:v1`
To test it, open a new terminal, run cmd `curl http://localhost:8080`

## Cleanup: Stop and delete the running the container
In your terminal, run cmd `docker stop mywebapp` to stop the container and run cmd `docker rm mywebapp` to delete the container.
Note: 
- After you delete the container, the `mywebappimage` docker image should still be here where you can check via cmd `docker images`.
- You can always list all docker containers via cmd `docker ps -a`

# Issues
Please raise an issue if you have any questions. Thank you.
