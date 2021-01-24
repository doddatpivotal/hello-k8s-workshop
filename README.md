Hello K8s Workshop
=====================

Sample workshop content using Markdown formatting for pages.

For more detailed information on how to create and deploy workshops, consult
the documentation for eduk8s at:

* https://docs.eduk8s.io

If you already have the eduk8s operator installed and configured, to deploy
and view this sample workshop, run:

```
kubectl apply -f https://raw.githubusercontent.com/doddatpivotal/hello-k8s-workshop/master/resources/workshop.yaml
kubectl apply -f https://raw.githubusercontent.com/doddatpivotal/hello-k8s-workshop/master/resources/training-portal.yaml
```

This will deploy a training portal hosting just this workshop. To get the
URL for accessing the training portal run:

```
kubectl get trainingportal/hello-k8s
```

The training portal is configured to allow anonymous access.

# Building the base image

export BASE_IMAGE=harbor.stormsend.tkg-vsphere-lab.winterfell.live/eduk8s/base-image
docker build . -t $BASE_IMAGE
docker push $BASE_IMAGE

# Building the docker image

export HELLO_K8S_IMAGE=harbor.stormsend.tkg-vsphere-lab.winterfell.live/eduk8s/hello-k8s-workshop
docker build . -t $HELLO_K8S_IMAGE
docker push $HELLO_K8S_IMAGE

## Deploy

k delete -f resources

k apply -f resources

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
