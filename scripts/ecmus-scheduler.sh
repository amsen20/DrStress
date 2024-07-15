#!/bin/sh
function run_ecmus_scheduler() {
  execute_scenarios_ecmus;
}


function execute_scenarios_ecmus() {
  manifests_path="$(pwd)/manifests/ecmus-scheduler/"
  echo "execute_scenarios for ecmus scheduler"
#  run_normal_scenarios $manifests_path
#  run_wavy_scenarios $manifests_path
}

