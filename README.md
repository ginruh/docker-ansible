# docker-ansible

## Why?
- For testing and developing with ansible
- For running ansible playbooks for building docker images.
  I use ansible with vagrant for provisioning vm. So, why not using same ansible codebase to build docker images.

## Information
These images are based on ``almalinux`` docker image.

These images supports 2 flavors of ansible installation:-
- ``ansible``
- ``ansible-core``

``ansible`` versioning have image names like:-
- ``iyorozuya/ansible:ansible_7.0``
- ``iyorozuya/ansible:ansible_7.1`` and so on

``ansible-core`` versioning have image names like:-
- ``iyorozuya/ansible:ansible-core_2.12``
- ``iyorozuya/ansible:ansible-core_2.13`` and so on

## Prerequisites
- ``docker``

## Usage
  [![dockeri.co](https://dockeri.co/image/iyorozuya/ansible)](https://hub.docker.com/r/iyorozuya/ansible)

  * Via shell
     ```sh
      # ansible-core v2.14.x 
      docker run -itd -v ~/code:/app --name ansible-playground iyorozuya/ansible:ansible-core_2.14
     ```
  * Via docker-compose
      ```yaml
        ansible-playground:
          image: iyorozuya/ansible:ansible-core_2.14
          user: alma
          volumes:
          - "~/code:/app"
      ```
      
## Show your support
If you find any bug or a feature, please file an issue.

## License
MIT
