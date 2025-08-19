# how to build the Docker image and send to Docker Hub

- update the references in the Dockerfile to current ones
- build the image via podman
- push the updated image


## Build the image via podman

```
cd Docker_build
podman build --arch=x86_64 --tag ghcr.io/luutuankiet/dbt_all:v1.9.0 .
podman push ghcr.io/luutuankiet/dbt_all:v1.9.0 ghcr.io/luutuankiet/dbt_all:v1.9.0
```


## Installing podman
```brew install podman
podman machine init
podman machine start
```

## Configuring PAT for Podman to Github Push
[Bloggy Blog](https://geraldonit.com/2022/08/30/manually-publish-images-to-github-container-registry-ghcr/)