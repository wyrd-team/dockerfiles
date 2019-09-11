FROM wyrdteam/anyenv:latest-buster-node-10.16.3 AS node

FROM wyrdteam/anyenv:latest-buster-ruby-2.5.1

USER developer

COPY --from=node /home/developer/.anyenv/envs/nodenv /home/developer/.anyenv/envs/nodenv
