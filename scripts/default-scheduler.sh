#!/bin/bash
manifests_path="$(pwd)/manifests/kube-scheduler/"
normal_scenarios_path=$(realpath "$(pwd)/scenarios/normal")
wavy_scenarios_path=$(realpath "$(pwd)/scenarios/wavy")

function run_default_scheduler() {
  setup_env;
  execute_scenarios;
  cleanup_env;
}

function setup_env() {
  echo "************************************************************************"
  echo "setting up env for kube-scheduler"
  kubectl apply -f $manifests_path
}


function execute_scenarios() {
  echo "execute_scenarios for kube-scheduler"
  echo $normal_scenarios_path

  echo "running normal scenarios ..."
  for filename in $normal_scenarios_path/*.json; do
      [ -e "$filename" ] || continue
    run_scenario $filename
    echo "going to sleep between scenarios (5m)"
    sleep 5m
  done
  echo "normal scenarios are successfully ran ..."


  echo "running wavy scenarios ... "
  for filename in $wavy_scenarios_path/*.json; do
      [ -e "$filename" ] || continue
    run_scenario $filename
    echo "going to sleep between scenarios (5m)"
    sleep 5m
  done
  echo "wavy scenarios are successfully ran ..."
}

function cleanup_env() {
  echo "cleaning up env after kube-scheduler run"
  kubectl delete -f $manifests_path

  echo "cleaning up complete, going to sleep (5m)"
  sleep 5m

  echo "************************************************************************"
}

function run_scenario() {
  echo "----------------------------------------------------"
  echo "scenario name: $1"
  echo "start time: $(date '+%Y-%m-%d %H:%M:%S')"
  ./stress --path $1
  echo "end time: $(date '+%Y-%m-%d %H:%M:%S')"
  echo "----------------------------------------------------"
}
