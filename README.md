<h1 align="center">Welcome to MyLab 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-0.9.0-blue.svg?cacheSeconds=2592000" />
  <a href="#" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
</p>

A base for learning, playing and testing code

## Motivation
There are certain times when I am want to test, experiment or learn something without any setup. 
Setting up environment takes ample time and also it becomes counter productive when doing it again and again.

For example, I sometimes need to check if a piece of program for example in ansible works but I have to do certain setup. This repo acts a simple fast and way to get runtimes and environments via docker images.

## Usage

### Ansible

  [![dockeri.co](https://dockeri.co/image/iyorozuya/ansible)](https://registry.hub.docker.com/iyorozuya/ansible/)

  * Via shell
     ```sh
      # Tag refers to ansible version
      # Please refer to Dockerhub or ansible dir of this repo to see supported versions
      docker run -v ~/code:/app iyorozuya/ansible:2.11 ansible-playground # ansible 2.11
     ```
  * Via docker-compose
      ```yaml
        ansible-playground:
          image: iyorozuya/ansible:2.11
          user: rocky
          volumes:
            - "~/code:/app"
      ```
      
## Todo
I will try to add tools/environments which I use have to once in a while. 

- [ ] Webhooks
- You suggest me :)

## Author

👤 **Akshay Mahajan**

* Github: [@iyorozuya](https://github.com/iyorozuya)

## Show your support
If you find any bug or a feature, please file an issue.

Please, give a ⭐️ if this project helped you!

## License
MIT