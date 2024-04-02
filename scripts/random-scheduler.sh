#!/bin/sh

function run_random_scheduler() {
  execute_scenarios_random;
}

function execute_scenarios_random() {
  manifests_path="$(pwd)/manifests/random-scheduler/"
  echo "execute_scenarios for random scheduler"
  run_normal_scenarios $manifests_path
  run_wavy_scenarios $manifests_path
}
