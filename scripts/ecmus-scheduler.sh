#!/bin/sh
function run_ecmus_scheduler() {
  echo "hello world from ecmus"
#  execute_scenarios_ecmus;
}


function execute_scenarios_ecmus() {
  manifests_path="$(pwd)/manifests/ecmus-scheduler/"
  echo "execute_scenarios for ecmus scheduler"
  run_normal_scenarios $manifests_path
  run_wavy_scenarios $manifests_path
}

