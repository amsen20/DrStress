
function run_cloud_node_first_scheduler() {
  execute_scenarios_cloud_first;
}

function execute_scenarios_cloud_first() {
  manifests_path="$(pwd)/manifests/cloud-first-scheduler/"
  echo "execute_scenarios for cloud-first-scheduler"
  run_normal_scenarios $manifests_path
  run_wavy_scenarios $manifests_path
}

