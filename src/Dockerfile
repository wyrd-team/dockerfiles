FROM wyrdteam/anyenv:latest-buster-devel AS devel

USER developer:developers

# install ruby 2.5.1
RUN eval "$(anyenv init -)" \
  && rbenv install 2.5.1 \
  && rbenv rehash \
  && rbenv global 2.5.1 \
  && ln -sfn $(rbenv root)/versions/2.5.1 $(nodenv root)/versions/2.5

FROM wyrdteam/anyenv:latest-buster

USER root:root
COPY --from=devel /home/developer/.anyenv/envs/rbenv /home/developer/.anyenv/envs/rbenv
RUN chown -R developer:developers /home/developer/.anyenv

USER developer:developers
