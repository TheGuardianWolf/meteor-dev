FROM frolvlad/alpine-glibc

RUN apk upgrade && apk add bash bash-completion git curl sudo

RUN adduser meteor -D -s /bin/bash \
    && echo 'meteor ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && curl -fL https://raw.githubusercontent.com/orctom/alpine-glibc-packages/master/usr/lib/libstdc++.so.6.0.21 -o /usr/lib/libstdc++.so.6

USER meteor

RUN curl -sSL https://install.meteor.com/ \
    | sed 's/VERBOSITY="--silent"/VERBOSITY="--progress-bar"/' \
    | sh

EXPOSE 3000
