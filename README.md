# GReX Docker Container

The container provided here (and built in CI) contains all of the pipeline
software used in GReX. Running software like this is in lieu of using Guix, as
that might be tricky if one isn't on a Linux machine (i.e. MacOS).

## Running

We build containers in CI, so no need to build on your own. As most of the
software needs to use the GPU, make sure you setup the [NVIDIA Container
Runtime](https://developer.nvidia.com/nvidia-container-runtime).

To get our image on your local machine, simply:

```sh
docker pull ghcr.io/grex-telescope/docker:main
```

To make sure everything is working, run the dedispersion test with

```sh
docker run -it --gpus all ghcr.io/grex-telescope/docker:main testdedisp
```

Assuming that threw no GPU errors, you should be good to go!
