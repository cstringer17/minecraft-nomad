#!/bin/bash
sudo nomad agent -dev -bind 0.0.0.0 -log-level INFO -config=/home/archlinux/nomad/nomad-client.conf
sudo consul agent -dev -log-level INFO -client 0.0.0.0 -config-file=/home/archlinux/nomad-dev/consul/consul-config.hcl