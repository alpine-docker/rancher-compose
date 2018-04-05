# Rancher-compose
Auto-trigger docker build for [rancher-compose](https://github.com/rancher/rancher-compose) when new release is announced

### Repo:

https://github.com/alpine-docker/rancher-compose

### Daily build logs:

https://travis-ci.org/alpine-docker/rancher-compose

### Docker iamge tags:

https://hub.docker.com/r/alpine/rancher-compose/tags/

# Usage:

    # must mount the local folder to /apps in container.
    docker run -ti --rm -v $(pwd):/apps alpine/rancher-compose:0.12.4 --help

    # run rancher-compose container as command
    alias rancher-compose="docker run -ti --rm -v $(pwd):/apps rancher-compose:0.12.4"
    rancher-compose --help

# The Processes to build this image

* Enable Travis CI cronjob on this repo to run build daily on master branch
* Check if there are new tags/releases announced via Github REST API
* Match the exist docker image tags via Hub.docker.io REST API
* If not matched, build the image with latest version as tag and push to hub.docker.com
* Versions old than 0.12.4 were manually built and pushed.
