from alpine:latest

RUN apk update
RUN apk upgrade

RUN apk add musl-dev make gcc ncurses-dev ncurses-libs

WORKDIR /root
RUN wget https://sourceforge.net/projects/ninvaders/files/latest/download -O nInvaders.tar.gz
RUN tar xfvz /root/nInvaders.tar.gz
RUN cd ninvaders-*/ &&  make && cp nInvaders /usr/bin
RUN rm -rf ninvaders*

RUN apk del musl-dev make gcc ncurses-dev
RUN apk verify

ENTRYPOINT /usr/bin/nInvaders

