FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive

# install develop and chores
RUN apt-get update -qq \
  && apt-get install -y \
     # chores
     curl \
     git \
     sudo \
     vim \
     # develop
     build-essential \
     default-libmysqld-dev \
     libncurses-dev \
     libreadline-dev \
     libssl-dev \
     zlib1g-dev \
  && apt-get clean -y -qq \
  && rm -rf /var/lib/apt/lists/* \
  && echo "alias ll='ls -alh'" > /etc/profile.d/aliases.sh

# Install anyenv
RUN git clone --depth 1 https://github.com/anyenv/anyenv /usr/local/anyenv \
  && rm -rf /usr/local/anyenv/.git \
  && ln -s /usr/local/anyenv/bin/anyenv /usr/local/bin/anyenv \
  && echo 'eval "$(anyenv init -)"' > /etc/profile.d/anyenv.sh

# Add developer user
RUN groupadd --gid 1000 developers \
  && useradd --uid 1000 --gid developers --shell /bin/bash --create-home developer \
  && echo 'developer ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-developer \
  && echo 'Defaults    env_keep += "DEBIAN_FRONTEND"' >> /etc/sudoers.d/env_keep \
  && echo 'root:root' | chpasswd \
  && echo 'developer:developer' | chpasswd

SHELL ["/bin/bash", "-c"]

# Setup developer environment
USER developer:developers
RUN anyenv install --force-init \
  && echo noswapfile >> ~/.vimrc

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
