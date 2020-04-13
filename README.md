# Jenkins slave with Alpine Linux for Docker [![](https://images.microbadger.com/badges/image/thedrhax/jenkins-slave-alpine.svg)](https://hub.docker.com/r/thedrhax/jenkins-slave-alpine)

This image extends is based on [alpine:3.11](https://hub.docker.com/r/_/alpine).

## Example

The command below will start a slave named "test" that will try to connect to Jenkins located at http://jenkins:8080. You can change these settings by overriding variables listed below.

```
docker run -it --rm --name slave -e MASTER_URL=http://jenkins:8080 -e SLAVE_NAME=test -e SLAVE_SECRET=... thedrhax/jenkins-slave-alpine
```

### Setting up master Jenkins

* Install the [Swarm Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin).
* Make sure that slave will be able to connect to HTTP and 50000/tcp ports of master.
* Create a permanent agent and write down the generated token.

### Slave configuration variables

* `-e MASTER_URL=http://jenkins:8080` — URL of Jenkins Master
* `-e SLAVE_NAME=...` — Name of the permanent agent (must be the same as specified in Jenkins);
* `-e SLAVE_SECRET=...` — Token assigned to this permanent agent by Jenkins
* `-e SLAVE_ROOT=/data` — Default working directory

### Alpine configuration

* `-e REQUIRED_PACKAGES=""` — list of packages to be installed when container is started

## Projects based on this image

* [thedrhax/jenkins-slave-docker](https://github.com/thedrhax-dockerfiles/jenkins-slave-docker)

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](./LICENSE) file for details.
