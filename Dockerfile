#You may need to change the base Image of Jenkins in future or the below one also should work
FROM jenkins/jenkins:lts
USER root

#Here we are installing... Docker client
RUN mkdir -p /tmp/download && \
 curl -L https://download.docker.com/linux/static/stable/x86_64/docker-18.03.1-ce.tgz | tar -xz -C /tmp/download && \
 rm -rf /tmp/download/docker/dockerd && \
 mv /tmp/download/docker/docker* /usr/local/bin/ && \
 rm -rf /tmp/download && \
 #Here we are adding the group called 'docker' with GID '999' -This GID need to be matched with host machine(i.e. where docker engine is running) GID of group 'docker'
 groupadd -g 999 docker && \
 #Here we are adding user 'jenkins' to group 'docker'
 usermod -aG docker jenkins

USER jenkins