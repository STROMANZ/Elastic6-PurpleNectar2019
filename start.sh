#!/bin/sh

if [ -z "$1" ]
then
  export NUMINSTANCES=1
else
  export NUMINSTANCES=$1
fi


COUNT=`expr 30000 + $NUMINSTANCES`

for i in $(eval echo {30001..$COUNT})
do
  export INSTANCE=$i

  echo "Creating instance $INSTANCE of stack, Kibana on host port $INSTANCE..."

  docker-compose -p es_stack_$INSTANCE up -d
done
