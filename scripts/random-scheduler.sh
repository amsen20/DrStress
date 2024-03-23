manifests_path="../manifests/random-scheduler/"

function run_random_scheduler() {
  setup_env;
  execute_scenarios;
  cleanup_env;
}

function setup_env() {
  echo "************************************************************************"
  echo "setting up env for random-scheduler"
  kubectl apply -f $manifests_path
}


function execute_scenarios() {
  echo "execute_scenarios for random scheduler"
  run_normal_scenarios
  run_wavy_scenarios
}

function cleanup_env() {
  echo "cleaning up env after random-scheduler run"
  kubectl delete -f $manifests_path

  echo "clean up complete, going to sleep (5m)"
  sleep 5m
  echo "************************************************************************"
}
