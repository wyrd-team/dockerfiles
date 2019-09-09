FROM wyrdteam/anyenv:latest-buster

USER root

# Setup build environment
RUN apt-get update -qq \
  && apt-get install -y \
     build-essential \
     libreadline-dev \
     libssl-dev \
     zlib1g-dev \
  && apt-get clean -y -qq \
  && rm -rf /var/lib/apt/lists/*

USER developer

# install nodenv
RUN anyenv install nodenv \
  && eval "$(anyenv init -)" \
  && touch $(nodenv root)/default-packages \
  && echo "yarn =1.17.3" >> $(nodenv root)/default-packages

# install rbenv
RUN anyenv install rbenv
