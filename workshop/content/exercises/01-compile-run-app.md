Welcome to our sample application.  It is a simple spring-boot app that says hello, reporting the version of the app, and the host it is running on.

#### Clone the git repo

```execute-1
git clone https://github.com/doddatpivotal/hello-k8s
```

#### Main Class

Check out the main class.  A single rest controller that responds to requests at the root.

```editor:open-file
file: ~/hello-k8s/src/main/java/com/vmware/tanzu/hellok8s/HelloK8sApplication.java
```

#### Personalize the properties

Let's set the name to your workshop session.  Or you can manually edit the configuration with your name.

```editor:open-file
file: ~/hello-k8s/src/main/resources/application.yaml
```

Test editing file
```editor:insert-value-into-yaml
file: ~/hello-k8s/src/main/resources/application.yaml
path: hello-k8s.name2
value: {{ session_namespace }}
```

```editor:append-lines-to-file
file: ~/hello-k8s/src/main/resources/application.yaml
text: |
    foo: barr
```

#### Compile and run the fat jar

```execute-1
cd hello-k8s
./mvnw package -D skipTests
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
