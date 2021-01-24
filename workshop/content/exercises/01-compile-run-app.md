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
file: ~/hello-k8s/src/main/resources/application.yaml
```

```editor:insert-value-into-yaml
file: ~/hello-k8s/src/main/resources/application.yaml
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


# Install Eduk8s Operator

kubectl apply -k "github.com/eduk8s/eduk8s?ref=master"

# Validate Running

kubectl get all -n eduk8s

# Set ingress domain
kubectl set env deployment/eduk8s-operator -n eduk8s INGRESS_DOMAIN=riverrun.tkg-vsphere-lab.winterfell.live

TODO: Createa a wildcard cert




kubectl apply -f https://raw.githubusercontent.com/eduk8s-labs/lab-k8s-fundamentals/master/resources/workshop.yaml

kubectl apply -f https://raw.githubusercontent.com/eduk8s-labs/lab-k8s-fundamentals/master/resources/training-portal.yaml

kubectl delete -f https://raw.githubusercontent.com/eduk8s/lab-markdown-sample/master/resources/workshop.yaml
kubectl delete -f https://raw.githubusercontent.com/eduk8s/lab-markdown-sample/master/resources/training-portal.yaml


apiVersion: cert-manager.io/v1alpha2
kind: Certificate
metadata:
  name: wildcard-cert
  namespace: eduk8s
spec:
  secretName: wildcard-cert-tls
  duration: 2160h # 90d
  renewBefore: 360h # 15d
  organization:
  - vmware
  isCA: false
  keySize: 2048
  keyAlgorithm: rsa
  keyEncoding: pkcs1
  dnsNames:
  - '*.riverrun.tkg-vsphere-lab.winterfell.live'
  issuerRef:
    name: letsencrypt-contour-cluster-issuer
    kind: ClusterIssuer

kubectl set env deployment/eduk8s-operator -n eduk8s INGRESS_SECRET=wildcard-cert-tls
