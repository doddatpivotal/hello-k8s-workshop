It's great to have a container image, but in order to run in kubernetes, you must publish it to a container registry.  Harbor is a CNCF graduated OSS project, that perfectly suites this need.  It is also included as part of a Tanzu subscription.

#### Access Harbor UI

Next, click the link below and login to Harbor with the user "admin" and password "Harbor12345".  

```dashboard:open-url
url: https://{{ ENV_REGISTRY }}/harbor/projects
```

#### Login to Harbor from CLI

Build the docker image giving it the tag of our private harbor registry, project, and repository name.

```execute-1
docker login {{ ENV_REGISTRY }} -u admin -p Harbor12345
```

#### Push your image to Harbor

```execute-1
docker push {{ ENV_REGISTRY }}/{{ ENV_PROJECT }}/{{ session_namespace }}:v1
```
