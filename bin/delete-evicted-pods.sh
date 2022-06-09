#!/bin/bash

echo "found: $(kubectl get pods -A | grep Evicted | wc -l) evicted pods"

IFS=$'\n'
for line in $(kubectl get pods -A | awk {'printf "%s,%s,%s\n", $1,$2,$4'} | grep -E "Evicted"); do 
  ns=$(echo $line | cut -d',' -f1)
  pod=$(echo $line | cut -d',' -f2)
  echo "delete $ns $pod"
  kubectl delete pod -n $ns $pod
done