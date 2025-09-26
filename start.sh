#!/bin/sh

cd /tmp

# Download and extract the latest OpenStarbound server build
wget https://github.com/OpenStarbound/OpenStarbound/releases/latest/download/OpenStarbound-Linux-Clang-Server.zip -O OpenStarbound-Linux-Clang-Server.zip \
    && unzip -o OpenStarbound-Linux-Clang-Server.zip && rm OpenStarbound-Linux-Clang-Server.zip \
    && tar --no-same-owner --no-same-permissions -xf server.tar --strip-components=1 -C /starbound && rm server.tar

cd /starbound/linux
./starbound_server

exit
