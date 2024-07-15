function run_smallest_edge_node_first_scheduler() {
  execute_scenarios_smallest_edge_node;
}

function execute_scenarios_smallest_edge_node() {
  manifests_path="$(pwd)/manifests/smallest-edge-node-first/"
  echo "execute scenarios for smallest-fitting-edge-node scheduler"
  run_normal_scenarios $manifests_path
  run_wavy_scenarios $manifests_path
}
