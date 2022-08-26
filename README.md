[![mabichuks](https://circleci.com/gh/mabichuks/project-ml-microservice-kubernetes.svg?style=svg)](https://circleci.com/gh/mabichuks/project-ml-microservice-kubernetes)

# Operationalize a Machine Learning Microservice API

## Overview

This is a repository for 4th and final project of the **Udacity Cloud DevOps Engineer Nanodegree Program**.

The aim of this project is to operationalize a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on using [docker](https://docker.com), an open source platform for building, deploying and managing containers, as well as [kubernetes](https://kubernetes.io/), an open-source system for automating the management of containerized applications.

## Instructions

- Create a local environment using the following commands:

  ```
  	python3 -m venv ~/.devops
  	source ~/.devops/bin/activate
  ```
- A local environment can also be created using the `Makefile` by running the following command:
    ```
        make setup
    ```

  At this point your command line should be similar to this:
  `(.devops) <User>:project-ml-microservice-kubernetes<user>$`. The `(.devops)` indicates that your environment has been activated, and you can proceed with further package installations.

- Install project dependencies using `Makefile`. The dependencies to be installed are listed in the `requirements.txt` file; these can be installed using `pip` commands in the provided `Makefile`. While in your virtual environment, type the following command to install these dependencies.

  ```
  make install
  ```

- Lint python files and docker files using the command:
  ```
    make lint
  ```
- Run webapp image using

  ```
  ./run_docker.sh
  ```

  and then run

  ```
   ./make_predictions.sh
  ```

  in a separate terminal. Check output in first terminal.

## Summary of Repository files
All files and can be found in the root folder of the [project-ml-microservice-kubernetes](https://github.com/mabichuks/project-ml-microservice-kubernetes) repository.

- **requirements.txt** - This text file has a list of package dependencies for `app.py`
- **Makefile** - This file contains instructions to setup, install, test and lint the program in a virtual environment
- **run_docker.sh** - This script file creates a docker image. It contains instructions on the image name, tag etc.
  - `docker build --tag=mabi/udacity-docker-devops .` command builds the docker image with the tag `mabi/udacity-docker-devops` using the Dockerfile. This process involves copying source code into a working directory, installing dependencies listed in requirements.txt file and exposing port 80 where the app is running.
  - `docker run -p 8000:80 ` command runs the docker image and  exposes the app at port 8000. The script will build docker image using `--tag=mabi/udacity-docker-devops`.
  - `docker image ls` lists the built images
- **upload_docker.sh** - This script uploads docker image to [Dockerhub](https://hub.docker.com/) after authenticating your Dockerhub credentials.
- **run_kubernetes.sh** - This script runs the docker image in a Kubernetes cluster.
  - `kubectl run udacity-docker-devops  --image=$dockerpath --port=80 --labels app=udacity-docker-devops` command runs the docker image in a kubernetes pod
  - `kubectl get pods` can be used to checks the state of all available pods.
  - `kubectl port-forward udacity-docker-devops  8000:80` allows all application requests to be handled at port 8000.
- **./make_prediction.sh** is used to send input data to docker image in kubernetes pod and receive house pricing predictions.
- **.circleci/config.yml** - contains circleci config.yml script to automate `make install` and `make lint` using continuous integration with Github and continuous delivery with circleci