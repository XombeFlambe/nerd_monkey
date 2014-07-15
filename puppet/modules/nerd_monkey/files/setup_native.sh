#!/bin/bash

cd
# Update this
git clone https://git.nerderylabs.com/nerd_monkey nerd_monkey_native
cd nerd_monkey_native
git checkout qa
cp config/database.yml{.dist,}
cp config/newrelic.yml{.dist,}
cp config/application.yml{.dist,}

bundle install
bundle exec rake db:schema:load
bundle exec rake db:seed

echo 'run foreman start'
