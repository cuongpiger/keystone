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
  docker exec openstack-rabbitmq rabbitmqctl add_user "stackrabbit" "secret"
  docker exec openstack-rabbitmq rabbitmqctl set_permissions "stackrabbit" ".*" ".*" ".*"
  ```

* Run MySQL inside Docker container
  ```bash=
  docker run --name openstack-mysql --network host -e MYSQL_ROOT_PASSWORD=secret -d mysql:8
  docker exec -it openstack-mysql bash
  
  # inside the MySQL-8 Docker container
  mysql -uroot -psecret -e 'DROP DATABASE IF EXISTS stats;'
  mysql -uroot -psecret -e 'CREATE DATABASE stats CHARACTER SET utf8;'
  mysql -uroot -psecret -e 'CREATE TABLE queries (db VARCHAR(32), op VARCHAR(32), count INT, PRIMARY KEY (db, op)) ENGINE MEMORY' stats
  
  mysql -uroot -psecret -e 'DROP DATABASE IF EXISTS keystone;'
  mysql -uroot -psecret -e 'CREATE DATABASE keystone CHARACTER SET utf8;'
  ```

* Clone this repo.
* Go to the root directory of this repo.
* Run the fernet command
* Using `pip install -e .`
* Run the db_sync, fernet_setup and bootstrap_servers inside cmd directory.
* Run app.py
* `export OS_CLOUD=devstack-admin`
* `openstack project show "admin" -f value -c id`, check