FROM wyrdteam/anyenv:latest-buster-node-10.16.3 AS node

FROM wyrdteam/anyenv:latest-buster-ruby-2.5.1

USER root:root
COPY --from=node /home/developer/.anyenv/envs/nodenv /home/developer/.anyenv/envs/nodenv
RUN chown -R developer:developers /home/developer/.anyenv

USER developer:developers

ENV PATH $PATH:/home/developer/.anyenv/envs/nodenv/shims
ENV PATH $PATH:/home/developer/.anyenv/envs/nodenv/bin
