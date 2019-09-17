FROM wyrdteam/anyenv:latest-buster

USER developer:developers

# install nodenv
RUN anyenv install nodenv \
  && eval "$(anyenv init -)" \
  && touch $(nodenv root)/default-packages \
  && echo "yarn =1.17.3" >> $(nodenv root)/default-packages

# install node 10.16.3
RUN eval "$(anyenv init -)" \
  && nodenv install 10.16.3 \
  && nodenv rehash \
  && nodenv global 10.16.3 \
  && ln -sfn $(nodenv root)/versions/10.16.3 $(nodenv root)/versions/10 \
  && ln -sfn $(nodenv root)/versions/10.16.3 $(nodenv root)/versions/10.16
