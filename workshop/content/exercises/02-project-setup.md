This is an example page for exercises to be done for the workshop. You would remove this page, replace it with your own and then adjust the `workshop.yaml` and `modules.yaml` file to list your pages instead.

In this example the pages which make up the core of the workshop content are placed in a sub directory. This is only done as a suggestion. You can place all pages at the same directory level if you wish.

Included below are some tests and examples of page formatting using Markdown.

#### Standard code block

```
echo "standard code block"
```

#### Click text to execute

```execute
echo "execute in terminal 1"
```

#### Click text to execute (with target)

```execute-1
echo "git clone https://github.com/doddatpivotal/hello-k8s"
```

```editor:open-file
file: src/main/resources/application.yaml
```

```editor:insert-value-into-yaml
file: ~/exercises/sample.txt
path: hello-k8s.name
value: {{ session_namespace }}
```

```execute
./mvnw package
java -jar target/hello-k8s-0.0.1-SNAPSHOT.jar
```

```execute-2
curl localhost:8080
```

```execute
<ctrl-c>
```

#### Variable interpolation

workshop_name: {{ workshop_name }}

session_namespace: {{ session_namespace }}

workshop_namespace: {{ workshop_namespace }}

training_portal: {{ training_portal }}

ingress_domain: {{ ingress_domain }}

ingress_protocol: {{ ingress_protocol }}

#### Web site links

[External](https://github.com/eduk8s)
