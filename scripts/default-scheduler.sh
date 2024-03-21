manifests_path="../manifests/kube-scheduler/"

function run_default_scheduler() {
  setup_env;
  execute_scenarios;
  cleanup_env;
}

function setup_env() {
  echo "************************************************************************"
  echo "setting up env for kube-scheduler"
  kubectl apply -f $manifests_path
}


function execute_scenarios() {
  echo "execute_scenarios for kube-scheduler"
}

function cleanup_env() {
  echo "cleaning up env after kube-scheduler run"
  kubectl apply -f $manifests_path

  echo "cleaning up complete, going to sleep (5m)"
  sleep 5m

  echo "************************************************************************"
}
