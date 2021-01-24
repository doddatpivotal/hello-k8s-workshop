Now let's see how this works as a container.


#### Dockerfile

The Dockerfile simply copies the packaged jar file and then sets the entry point of the process

```editor:open-file
file: ~/hello-k8s/Dockerfile
```

#### Build the docker image

Build the docker image giving it the tag of our private harbor registry, project, and repository name.

```execute-1
docker build -t {{ REGISTRY_PROJECT }}/hello-k8s:v1 .
```

#### Main Class

Check out the main class.  A single rest controller that responds to requests at the root.

```editor:open-file
file: ~/hello-k8s/src/main/java/com/vmware/tanzu/hellok8s/HelloK8sApplication.java
```

#### Personalize the properties

Let's personalize the app's configuration.

```editor:open-file
file: ~/hello-k8s/src/main/resources/application.yaml
```

Set the name to your workshop session.  Or you can manually edit the configuration with your name.

```copy
{{ session_namespace }}
```

#### Compile and run the fat jar

```execute-1
cd hello-k8s
./mvnw package -DskipTests
java -jar target/hello-k8s-0.0.1-SNAPSHOT.jar
```

And now let's test it out.

```execute-2
curl localhost:8080
```

Stop the app

```execute-1
<ctrl-c>
```
