#!/usr/bin/env bash

/usr/sbin/set-app-permissions

if [ ! -e "tmp/.first_time_setup_complete" ]; then
  echo "Setting up for the first time..."

  gosu $APP_USER gem install bundler -v $BUNDLER_VERSION
  gosu $APP_USER bundle check || gosu $APP_USER bundle install -j$(nproc) --binstubs="$BUNDLE_BIN"
  gosu $APP_USER bundle binstubs bundler --force

  echo "Doing main app yarn install..."
  gosu $APP_USER yarn install

  echo "Bootstrapping database..."
  gosu $APP_USER rake db:schema:load db:seed &> /dev/null

  touch tmp/.first_time_setup_complete

  echo "Done with first-time setup!"
else
  echo "First-time setup has already been done."
  echo "  (Remove tmp/.first_time_setup_complete to redo.)"
fi

exec gosu $APP_USER "$@"
