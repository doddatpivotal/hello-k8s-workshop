Now let's see how this works as a container.


#### Dockerfile

The Dockerfile simply copies the packaged jar file and then sets the entry point of the process

```editor:open-file
file: ~/hello-k8s/Dockerfile
```

#### Build the docker image

Build the docker image giving it the tag of our private harbor registry, project, and repository name.

```execute-1
docker build -t {{ ENV_REGISTRY_PROJECT }}/{{ session_namespace }}:v1 .
```

#### Run and explore the running image

Run the container, mapping the containers port 8080 to the host's port 8080.  Notice the output, this is the container id.  We are asking docker to run this in the background using `-d` flag.

```execute-1
docker run -d -p 8080:8080 {{ ENV_REGISTRY_PROJECT }}/{{ session_namespace }}:v1
```

Ask docker for all the running containers.  Notice the container id.

```execute-2
docker ps
```

Just like the running the java app, you can access the logs written to standard output.

```execute-1
docker logs $(docker ps | grep hello-k8s | awk '{print $(1)}')
```

And let's test the app to ensure it is working as expected.  Notice we now see a host in the output.

```execute-2
curl localhost:8080
```

Let's stop the app.

```execute-1
docker stop $(docker ps | grep hello-k8s | awk '{print $(1)}')
```
