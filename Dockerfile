FROM debian:stretch
RUN apt-get update -y && apt-get upgrade -y && apt-get install curl bash bash-completion git sudo procps -y

RUN echo 'meteor ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

RUN useradd meteor --create-home --shell /bin/bash && echo "meteor:meteor" | chpasswd && adduser meteor sudo

USER meteor

RUN curl -sSL https://install.meteor.com/ \
    | sed 's/VERBOSITY="--silent"/VERBOSITY="--progress-bar"/' \
    | sh

EXPOSE 3000
