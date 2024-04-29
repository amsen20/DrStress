#!/bin/sh

function run_ecmus_no_qos_scheduler() {
  execute_scenarios_ecmus_no_qos;
}


function execute_scenarios_ecmus_no_qos() {
  manifests_path="$(pwd)/manifests/ecmus-no-qos-scheduler/"
  echo "execute_scenarios for ecmus-no-qos scheduler"
  run_normal_scenarios $manifests_path
  run_wavy_scenarios $manifests_path
}
