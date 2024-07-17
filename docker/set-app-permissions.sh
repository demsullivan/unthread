#!/usr/bin/env bash
# Ansible managed

if [ "$LOCAL_USER_ID" ]; then
  usermod -u $LOCAL_USER_ID $APP_USER
fi

chown -R $APP_USER $APP_PATH
chown -R $APP_USER $BUNDLE_PATH
chown -R $APP_USER $YARN_PATH
