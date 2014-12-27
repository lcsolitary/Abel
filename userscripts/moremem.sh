#!/bin/bash

declare -a ARG

for i in {1..1000000}
do
	ARG[$i]=`echo "scale=1000; 4*a(1);" | bc -l`  && echo $i &
done

wait
