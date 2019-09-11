FROM wyrdteam/anyenv:latest-buster-node-10.16.3

USER root

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

# install Allure
RUN ALLURE_VERSION="2.12.1" \
  && ALLURE_ARCHIVE_SHA1="4644f17d64e80230c00c7e8ec811a1fe2294f070" \
  && apt-get update -qq \
  && apt-get install -qq -y \
    openjdk-11-jre \
    zip \
  && curl --silent --show-error --location --fail --retry 4 --retry-delay 5 \
          --output /tmp/allure.zip \
          "http://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline/${ALLURE_VERSION}/allure-commandline-${ALLURE_VERSION}.zip" \
  && cd /tmp \
  && echo "${ALLURE_ARCHIVE_SHA1} *allure.zip" | sha1sum -c --quiet - \
  && unzip -qq allure.zip \
  && rm -rf allure.zip \
  && mv "allure-${ALLURE_VERSION}" /usr/local/share/allure \
  && ln -s /usr/local/share/allure/bin/allure /usr/local/bin/allure \
  && apt-get clean -y -qq \
  && rm -rf /var/lib/apt/lists/* \
  && allure --version

USER developer
