#!/bin/sh
COUNT=`expr 30000 + $1`

for i in $(eval echo {30001..$COUNT})
do
  export INSTANCE=$i

  echo "Creating instance $INSTANCE of stack, Kibana on host port $INSTANCE..."

  docker-compose -p es_stack_$INSTANCE up -d
done
