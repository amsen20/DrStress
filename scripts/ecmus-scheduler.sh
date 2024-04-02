#!/bin/sh
function run_ecmus_scheduler() {
  setup_env_random_scheduler;
  sleep 1m

  execute_scenarios;
  cleanup_env_random_scheduler;
}

function setup_env_ecmus_scheduler() {
  manifests_path="$(pwd)/manifests/ecmus-scheduler/"
  echo "************************************************************************"
  echo "setting up env for ecmus-scheduler"
  kubectl apply -f $manifests_path
}


function execute_scenarios() {
  echo "execute_scenarios for ecmus scheduler"
  run_normal_scenarios
  run_wavy_scenarios
}

function cleanup_env_ecmus_scheduler() {
  manifests_path="$(pwd)/manifests/ecmus-scheduler/"
  echo "cleaning up env after ecmus-scheduler run"
  kubectl delete  -f $manifests_path

  echo "clean up complete, going to sleep (5m)"
  sleep 5m
  echo "************************************************************************"
}
