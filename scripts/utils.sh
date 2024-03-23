normal_scenarios_path=$(realpath "$(pwd)/scenarios/normal")
wavy_scenarios_path=$(realpath "$(pwd)/scenarios/wavy")

function run_scenario() {
  echo "----------------------------------------------------"
  echo "scenario name: $1"
  echo "start time: $(date '+%Y-%m-%d %H:%M:%S')"
#  ./stress --path $1
  echo "./stress --path $1"
  echo "end time: $(date '+%Y-%m-%d %H:%M:%S')"
  echo "----------------------------------------------------"
}

function run_normal_scenarios() {
  echo "running normal scenarios ..."
  for filename in $normal_scenarios_path/*.json; do
      [ -e "$filename" ] || continue
    run_scenario $filename
    echo "going to sleep between scenarios (5m)"
    sleep 5m
  done
  echo "normal scenarios are successfully ran ..."
}


function run_wavy_scenarios() {
  echo "running wavy scenarios ... "
  for filename in $wavy_scenarios_path/*.json; do
      [ -e "$filename" ] || continue
    run_scenario $filename
    echo "going to sleep between scenarios (5m)"
    sleep 5m
  done
  echo "wavy scenarios are successfully ran ..."
}

function execute_scenarios() {
  run_normal_scenarios
  run_wavy_scenarios
}
