FROM wyrdteam/anyenv:latest-buster

USER developer:developers

ENV PATH $PATH:/home/developer/.anyenv/envs/rbenv/shims
ENV PATH $PATH:/home/developer/.anyenv/envs/rbenv/bin

# install rbenv
RUN anyenv install rbenv

# install ruby 2.5.1
RUN eval "$(anyenv init -)" \
  && rbenv install 2.5.1 \
  && rbenv rehash \
  && rbenv global 2.5.1 \
  && ln -sfn $(rbenv root)/versions/2.5.1 $(rbenv root)/versions/2.5
