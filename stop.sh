#!/bin/sh


echo "Stopping all containers named 'es_stack_*'"

docker container rm -f $(docker container ls -aq --filter="name=es_stack")
