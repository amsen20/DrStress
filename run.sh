#!/bin/bash
source ./scripts/utils.sh
source ./scripts/ecmus-no-migrations.sh
source ./scripts/ecmus-scheduler.sh
source ./scripts/default-scheduler.sh
source ./scripts/random-scheduler.sh
source ./scripts/biggest-edge-node-first.sh
source ./scripts/smallest-edge-node-first.sh
source ./scripts/default-scheduler.sh
source ./scripts/cloud-node.sh

function run() {
  run_ecmus_no_migration_scheduler > logs/ecmus-no-migration/ecmus-no-migration.txt 2> logs/ecmus-no-migration/ecmus-no-migration-err.txt
  sleep 5m

#  run_ecmus_scheduler > logs/ecmus/ecmus_scheduler.txt 2> logs/ecmus/ecmus_scheduler_err.txt
#  sleep 5m
#
#  run_default_scheduler > logs/kube_schedule/kube_schedule.txt 2> logs/kube_schedule/kube_schedule_err.txt
#  sleep 5m
#
#  run_random_scheduler > logs/random/random_scheduler.txt 2> logs/random/random_scheduler_err.txt
#  sleep 5m
#
#  run_biggest_edge_node_first_scheduler > logs/biggest-fitting/biggest_edge_node_first_scheduler.txt 2> logs/biggest-fitting/biggest_edge_node_first_scheduler_err.txt
#  sleep 5m
#
#  run_smallest_edge_node_first_scheduler > logs/smallest-fitting/smallest_edge_node_first_scheduler.txt 2> logs/smallest-fitting/smallest_edge_node_first_scheduler_err.txt
#  sleep 5m
#
#  run_cloud_node_first_scheduler > logs/cloud-first/run_cloud_first_scheduler.txt 2> logs/cloud-first/run_cloud_first_scheduler_err.txt
}

run;

