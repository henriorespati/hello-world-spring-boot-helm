# About this Repo

Deploy a spring boot app to OpenShift 4 by using Helm Chart

How To
------------
Helm init
```
$ helm create hello-world-spring-boot-helm
```

Helm validate
```
$ helm lint hello-world-spring-boot-helm
```

Helm install or upgrade
```
$ helm upgrade --install hello-world-spring-boot-helm .
```