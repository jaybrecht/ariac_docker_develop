# ARIAC Docker Develop

This repository contians a Dockerfile and scripts to run/develop for the ARIAC competition inside of a contiainer.

## Steps

1. Build the image with the command:

    ```
    docker build . -t ariac_docker_dev
    ```

2. Create a container to develop in. If your machine has an nvidia gpu start with installing the [nvidia_container_toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker). Then pass a second argument of `nvidia`.

    To create a container without gpu acceleration:

    ```
    ./create_container.sh {container_name}
    ```

    To create a container with gpu acceleration:

    ```
    ./create_container.sh {container_name} nvidia
    ```

3. Use the `open_terminal.sh` script to start working on the container. This can be run in multiple terminals to have multiple shells on the container. 

    ```
    ./open_terminal.sh {container_name}
    ```