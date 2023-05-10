Author: Cuong. Duong Manh


# 1. Development environment
## 1.1. Pre-requirements
* About system:
  * OS: Ubuntu 22.04.2 LTS x86_64
  * Kernel: 5.19.0-41-generic

* About software:
  * Anaconda 22.9.0
  * Docker 23.0.5
## 1.2. Installation
* Run RabbitMQ inside Docker container
  ```bash=
  docker run -d --name openstack-rabbitmq --network host bitnami/rabbitmq:3.11.15
  ```

* Run MySQL inside Docker container
  ```bash=
  docker run --name openstack-mysql --network host -e MYSQL_ROOT_PASSWORD=secret -d mysql:8
  ```

* Run 