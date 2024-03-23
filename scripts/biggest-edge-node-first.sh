#!/bin/sh


function run_biggest_edge_node_first_scheduler() {
  setup_env_run_biggest_edge_node_first_scheduler;
  sleep 1m

  execute_scenarios;
  cleanup_env_biggest_edge_node_scheduler;
}

function setup_env_run_biggest_edge_node_first_scheduler() {
  manifests_path="$(pwd)/manifests/biggest-edge-node-first/"
  echo "************************************************************************"
  echo "setting up env for biggest-edge-node-first"
  kubectl apply -f $manifests_path
}


function cleanup_env_biggest_edge_node_scheduler() {
  manifests_path="$(pwd)/manifests/biggest-edge-node-first/"
  echo "cleaning up env after biggest-edge-node-first run"
  kubectl delete  -f $manifests_path

  echo "cleaning up complete, going to sleep (5m)"
  sleep 5m
  echo "************************************************************************"
}
