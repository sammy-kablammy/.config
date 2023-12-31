FROM alpine:latest

WORKDIR /root

RUN apk update && apk add --no-cache \
    git \
    curl \
    tmux \
    vim \
    neovim \
    clang \
    neofetch

RUN git clone https://github.com/sammy-kablammy/.config.git
RUN echo "set -g prefix C-b" >> .config/tmux/tmux.conf

ENV TERM xterm-256color

CMD ["/bin/ash"]
