#!/bin/bash
namespace="ecmus"
scheduler_deployment_name="ecmus-scheduler"
normal_scenarios_path="./scenarios/normal/*.json"
wavy_scenarios_path="./scenarios/wavy/*.json"


echo "building the DrStress binary"
go build -o stress main.go
echo "DrStress binary has successfully been built"


function run_scenario() {
  echo "----------------------------------------------------"
  echo "scenario name: $1"
  echo "start time: $(date '+%Y-%m-%d %H:%M:%S')"
#  ./stress --path $1
#  kubectl rollout restart deploy $scheduler_deployment_name -n $namespace
  echo "end time: $(date '+%Y-%m-%d %H:%M:%S')"
  echo "----------------------------------------------------"
}


echo "running normal scenarios ..."
for filename in $normal_scenarios_path; do
  run_scenario $filename
  echo "going to sleep between scenarios (5m)"
  sleep 5m
done
echo "normal scenarios are successfully ran ..."

echo "running wavy scenarios ... "
for filename in $wavy_scenarios_path; do
  run_scenario $filename
  echo "going to sleep between scenarios (5m)"
  sleep 5m
done
echo "wavy scenarios are successfully ran ..."
