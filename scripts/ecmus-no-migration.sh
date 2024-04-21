#!/bin/zsh
function run_ecmus_no_migration_scheduler() {
  execute_scenarios_ecmus_no_migration;
}


function execute_scenarios_ecmus_no_migration() {
  manifests_path="$(pwd)/manifests/ecmus-no-migration-scheduler/"
  echo "execute_scenarios for ecmus-no-migration scheduler"
  run_normal_scenarios $manifests_path
  run_wavy_scenarios $manifests_path
}
