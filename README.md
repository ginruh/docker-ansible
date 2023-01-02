<h1>Ansible docker</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-0.9.0-blue.svg?cacheSeconds=2592000" />
  <a href="#" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
</p>

This repository contains Dockerfile of ansible for Docker's automated build published to the public DockerHub Registry.

## Information
- Based on ``almalinux`` docker image

## Prerequisites
- ``docker``

## Usage

  [![dockeri.co](https://dockeri.co/image/iyorozuya/ansible)](https://hub.docker.com/r/iyorozuya/ansible)

  * Via shell
     ```sh
      # Tag refers to ansible version
      # Please refer to DockerHub or ansible dir of this repo to see supported versions
      docker run -itd -v ~/code:/app --name ansible-playground iyorozuya/ansible:2.11 # ansible v2.11
     ```
  * Via docker-compose
      ```yaml
        ansible-playground:
          image: iyorozuya/ansible:2.11
          user: rocky
          volumes:
          - "~/code:/app"
      ```
      
## Show your support
If you find any bug or a feature, please file an issue.

## License
MIT
