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
  run_normal_scenarios
  run_wavy_scenarios
}

function cleanup_env() {
  echo "cleaning up env after kube-scheduler run"
  kubectl delete -f $manifests_path

  echo "cleaning up complete, going to sleep (5m)"
  sleep 5m

  echo "************************************************************************"
}

