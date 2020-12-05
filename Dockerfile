FROM ubuntu:20.04

# Basic user setup to allow vagrant to SSH into the container.
# This is the bare *minimum* for docker to be used as a vagrant provider.
# All provisioning should be done via the Vagrantfile.

# Create and configure vagrant user
RUN useradd --create-home -s /bin/bash vagrant
ENV HOME /home/vagrant
WORKDIR /home/vagrant

RUN apt-get update
RUN apt-get install -y openssh-server sudo
RUN mkdir -p $HOME/.ssh && touch $HOME/.ssh/authorized_keys
RUN mkdir /run/sshd
RUN chmod 0755 /run/sshd
# The public key that's baked into vagrant
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" > /home/vagrant/.ssh/authorized_keys
RUN chown -R vagrant: /home/vagrant/.ssh
RUN echo -n 'vagrant:vagrant' | chpasswd

# Enable passwordless sudo for the "vagrant" user
RUN mkdir -p /etc/sudoers.d
RUN install -b -m 0440 /dev/null /etc/sudoers.d/vagrant
RUN echo 'vagrant ALL=NOPASSWD: ALL' >> /etc/sudoers.d/vagrant

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]