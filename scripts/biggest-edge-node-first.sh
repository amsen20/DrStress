#!/bin/sh


function run_biggest_edge_node_first_scheduler() {
  execute_scenarios_biggest_fitting_edge_node_first_scheduler;
}

function execute_scenarios_biggest_fitting_edge_node_first_scheduler() {
  manifests_path="$(pwd)/manifests/biggest-edge-node-first/"
  echo "execute scenarios for biggest-edge-node-first"
#  run_normal_scenarios $manifests_path
#  run_wavy_scenarios $manifests_path
}
