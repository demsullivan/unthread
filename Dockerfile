FROM ruby:3.3-slim-bookworm

SHELL [ "/bin/bash", "--login", "-c" ]

ENV DEBIAN_FRONTEND=noninteractive

ARG NODE_VERSION="20.x"

COPY /docker/debian.ca.sources /etc/apt/sources.list.d
RUN rm /etc/apt/sources.list.d/debian.sources

RUN apt-get update \
      && apt-get install -y --no-install-recommends curl \
      && apt-get upgrade -y \
      && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION | bash -

RUN apt-get update && \
      apt-get install -y --no-install-recommends \
      build-essential \
      git \
      gosu \
      ruby-dev \
      libpq-dev \
      nodejs \
      openssh-client \
      tzdata \
      && rm -rf /var/lib/apt/lists/* \
      && gosu nobody true

RUN npm install -g yarn


COPY /docker/set-app-permissions.sh /usr/sbin/set-app-permissions
RUN  chmod a+x /usr/sbin/set-app-permissions

COPY /docker/entrypoint-dev.sh /usr/sbin/entrypoint
RUN chmod a+x /usr/sbin/entrypoint

ARG APP_PATH="/app"
ARG BUNDLE_PATH="/bundle"
ARG BUNDLE_BIN="$BUNDLE_PATH/bin"
ARG YARN_PATH="/app/node_modules"
ARG PORT="3000"
ARG APP_USER="rails"

ENV APP_PATH="$APP_PATH" \
    BUNDLE_BIN="$BUNDLE_BIN" \
    BUNDLE_PATH="$BUNDLE_PATH" \
    BUNDLER_VERSION="2.5.14" \
    GEM_HOME="$BUNDLE_PATH" \
    PATH="${BUNDLE_BIN}:${PATH}" \
    NODE_ENV="development" \
    YARN_PATH="$YARN_PATH" \
    LANG="C-UTF-8" \
    PORT="$PORT" \
    APP_USER="$APP_USER"

RUN useradd --shell /bin/bash --no-log-init -c "" -m $APP_USER

RUN mkdir -p /home/$APP_USER/.ssh \
      && ( echo 'StrictHostKeyChecking no' > /home/$APP_USER/.ssh/config ) \
      && chown -R $APP_USER:$APP_USER /home/$APP_USER/.ssh \
      && chmod -R go-rwx /home/$APP_USER/.ssh

WORKDIR $APP_PATH

ENTRYPOINT [ "bash", "--login", "/usr/sbin/entrypoint" ]
CMD        [ "bash", "--login" ]

EXPOSE $PORT