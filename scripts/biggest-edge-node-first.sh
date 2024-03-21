manifests_path="../manifests/biggest-edge-node-first/"
function run_biggest_edge_node_first_scheduler() {
  setup_env;
  execute_scenarios;
  cleanup_env;
}

function setup_env() {
  echo "setting up env for biggest-edge-node-first"
  kubectl apply -f $manifests_path
}


function execute_scenarios() {
  echo "execute_scenarios for biggest-edge-node-first"
}

function cleanup_env() {
  echo "cleaning up env after biggest-edge-node-first run"
  kubectl apply -f $manifests_path

  echo "cleaning up complete, going to sleep (5m)"
  sleep 5m
}
