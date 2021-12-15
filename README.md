<h1 align="center">Welcome to NeoLab 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-0.9.0-blue.svg?cacheSeconds=2592000" />
  <a href="#" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
</p>

A base for learning, experimenting and testing code.

## Motivation
There are certain times when I want to test, experiment or learn something without doing any setup. 
Setting up environment takes ample time and it becomes counter productive when doing it again and again.

For example, I need to check if a piece of program works in ansible I have to do certain setup. This repo acts a simple fast and way to get runtimes and environments via docker images.

## Usage

### Ansible

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