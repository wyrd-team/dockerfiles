FROM wyrdteam/anyenv:latest-buster-devel AS devel

USER developer:developers

# install node 10.16.3
RUN eval "$(anyenv init -)" \
  && nodenv install 10.16.3 \
  && nodenv rehash \
  && nodenv global 10.16.3 \
  && ln -sfn $(nodenv root)/versions/10.16.3 $(nodenv root)/versions/10 \
  && ln -sfn $(nodenv root)/versions/10.16.3 $(nodenv root)/versions/10.16

FROM wyrdteam/anyenv:latest-buster

USER root:root
COPY --from=devel /home/developer/.anyenv/envs/nodenv /home/developer/.anyenv/envs/nodenv
RUN chown -R developer:developers /home/developer/.anyenv

USER developer:developers
