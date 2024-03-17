#!/bin/bash

echo "building the DrStress binary"
go build -o stress main.go
echo "DrStress binary has successfully been built"

normal_scenarios_path="./scenarios/normal/*.json"
wavy_scenarios_path="./scenarios/wavy/*.json"
function run_scenario() {
  echo "scenario name: $1"
  echo "start time: $(date +%Y%m%d%H%M%S)"
  ./stress --path $1
  echo "end time: $(date +%Y%m%d%H%M%S)"
}


echo "running normal scenarios ..."
for filename in $normal_scenarios_path; do
  run_scenario $filename
done
echo "normal scenarios are successfully ran ..."

echo "running wavy scenarios ... "
for filename in $wavy_scenarios_path; do
  run_scenario $filename
done
echo "wavy scenarios are successfully ran ..."
