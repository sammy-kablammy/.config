FROM ubuntu:latest

# set some environment variables
ENV DEBIAN_FRONTEND noninteractive

# default working directory
WORKDIR /root

# update package lists (important!) and install some packages
RUN apt update && apt install -y \
    git \
    curl \
    tmux \
    vim \
    neofetch \
    && rm -rf /var/lib/apt/lists/* # clear package list to save image filesize

RUN git clone https://github.com/sammy-kablammy/.config.git
RUN echo "set -g prefix C-b" >> .config/tmux/tmux.conf

# make colors display properly
ENV TERM xterm-256color

# default commands (in this case, a shell)
CMD ["/bin/bash"]
