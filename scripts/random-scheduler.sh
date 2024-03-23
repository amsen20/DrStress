
function run_random_scheduler() {
  setup_env_random_scheduler;
  sleep 1m

  execute_scenarios;
  cleanup_env_random_scheduler;
}

function setup_env_random_scheduler() {
  manifests_path="$(pwd)/manifests/random-scheduler/"
  echo "************************************************************************"
  echo "setting up env for random-scheduler"
  kubectl apply -f $manifests_path
}


function execute_scenarios() {
  echo "execute_scenarios for random scheduler"
  run_normal_scenarios
  run_wavy_scenarios
}

function cleanup_env_random_scheduler() {
  manifests_path="$(pwd)/manifests/random-scheduler/"
  echo "cleaning up env after random-scheduler run"
  kubectl delete --force -f $manifests_path

  echo "clean up complete, going to sleep (5m)"
  sleep 5m
  echo "************************************************************************"
}
