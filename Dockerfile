# Use the official image as a parent image
FROM ubuntu:20.04

# Update the system
RUN apt update && apt upgrade -y

# Install OpenSSH Server
RUN apt update && apt install openssh-server sudo -y

# Create a user “sshuser” and group “sshgroup”
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test

ARG USERNAME=test
ARG PASSWORD=test

RUN  echo ${USERNAME}:${PASSWORD} | chpasswd

# Start SSH service
RUN service ssh start

# Expose the SSH port
EXPOSE 22
# Expose the HTTP port
EXPOSE 80

# Run SSH
CMD ["/usr/sbin/sshd", "-D"]