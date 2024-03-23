function run_smallest_edge_node_first_scheduler() {
  setup_env_smallest_edge_node_first_scheduler;
  execute_scenarios;
  cleanup_env_smallest_edge_node_first_scheduler;
}

function setup_env_smallest_edge_node_first_scheduler() {
  manifests_path="$(pwd)/manifests/smallest-edge-node-first/"
  echo "************************************************************************"
  echo "setting up env for smallest-edge-node-first-scheduler"
  kubectl apply -f $manifests_path
}

function cleanup_env_smallest_edge_node_first_scheduler() {
  manifests_path="$(pwd)/manifests/smallest-edge-node-first/"
  echo "cleaning up env after smallest-edge-node-first-scheduler run"
  kubectl delete --force -f $manifests_path

  echo "cleaning up complete, going to sleep (5m)"
  sleep 5m
  echo "************************************************************************"
}
