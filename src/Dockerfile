FROM wyrdteam/anyenv:latest-buster-ruby-2.5.1-node

USER root:root

# Install fonts
RUN apt-get update -qq \
  && apt-get install -qq -y \
    fonts-noto-color-emoji \
    fonts-noto-cjk \
  && apt-get clean -y -qq \
  && rm -rf \
    /var/lib/apt/lists/* \
    /var/cache/apt/archives

# Install google chrome browser
RUN apt-get update -qq \
  && apt-get install -qq -y \
    gnupg \
  && curl --silent --show-error --location --fail --retry 3 \
    https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && curl --silent --show-error --location --fail --retry 3 \
    --output /tmp/google-chrome-stable_current_amd64.deb \
    https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
  && apt-get install -y /tmp/google-chrome-stable_current_amd64.deb \
  && apt-get purge -y -qq \
     gnupg \
  && apt-get clean -y -qq \
  && rm -rf /var/lib/apt/lists/* /tmp/google-chrome-stable_current_amd64.deb

USER developer:developers
