
function run_cloud_node_first_scheduler() {
  setup_env_cloud_node_first_scheduler;
  execute_scenarios;
  cleanup_env_cloud_node_first_scheduler;
}

function setup_env_cloud_node_first_scheduler() {
  manifests_path="$(pwd)/manifests/cloud-first-scheduler/"
  echo "************************************************************************"
  echo "setting up env for cloud-first-scheduler"
  kubectl apply -f $manifests_path
}



function cleanup_env_cloud_node_first_scheduler() {
  manifests_path="$(pwd)/manifests/cloud-first-scheduler/"
  echo "cleaning up env after cloud-first-scheduler run"
  kubectl delete -f $manifests_path

  echo "cleaning up complete, going to sleep (5m)"
  sleep 5m
  echo "************************************************************************"
}
