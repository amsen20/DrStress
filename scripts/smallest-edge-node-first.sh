manifests_path="../manifests/smallest-edge-node-first/"
function run_smallest_edge_node_first_scheduler() {
  setup_env;
  execute_scenarios;
  cleanup_env;
}

function setup_env() {
  echo "************************************************************************"
  echo "setting up env for smallest-edge-node-first-scheduler"
  kubectl apply -f $manifests_path
}


function execute_scenarios() {
  echo "execute_scenarios for smallest-edge-node-first-scheduler"
  run_normal_scenarios
  run_wavy_scenarios
}

function cleanup_env() {
  echo "cleaning up env after smallest-edge-node-first-scheduler run"
  kubectl delete -f $manifests_path

  echo "cleaning up complete, going to sleep (5m)"
  sleep 5m
  echo "************************************************************************"
}
