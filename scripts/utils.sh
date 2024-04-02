normal_scenarios_path=$(realpath "$(pwd)/scenarios/normal")
wavy_scenarios_path=$(realpath "$(pwd)/scenarios/wavy")

function run_normal_scenarios() {
  echo "running normal scenarios ..."

  manifests_path=$1

  for filename in $normal_scenarios_path/*.json; do
      [ -e "$filename" ] || continue
    run_scenario $filename $manifests_path
  done
  echo "normal scenarios are successfully ran ..."
}


function run_wavy_scenarios() {
  echo "running wavy scenarios ... "

  manifests_path=$1

  for filename in $wavy_scenarios_path/*.json; do
      [ -e "$filename" ] || continue
    run_scenario $filename $manifests_path
  done
  echo "wavy scenarios are successfully ran ..."
}

function run_scenario() {
  manifests_path=$2

  echo "----------------------------------------------------"
  echo "scenario name: $1"

  echo "kubectl apply -f $manifests_path"
  sleep 2m

  echo "start time: $(date '+%Y-%m-%d %H:%M:%S')"
  echo "./stress --path $1"
  sleep 5m

  echo "kubectl delete -f $manifests_path"
  sleep 1m

  echo "end time: $(date '+%Y-%m-%d %H:%M:%S')"
  echo "----------------------------------------------------"
}
