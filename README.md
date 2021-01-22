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

