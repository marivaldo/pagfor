#!/bin/bash
gem uninstall pagfor
rm -rf ./pagfor-*.gem
gem build pagfor.gemspec
gem install pagfor --local ./pagfor-*.gem --no-ri --no-rdoc
