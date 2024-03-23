#!/bin/bash
source ./scripts/utils.sh
source ./scripts/default-scheduler.sh
source ./scripts/random-scheduler.sh
source ./scripts/biggest-edge-node-first.sh
source ./scripts/smallest-edge-node-first.sh
source ./scripts/default-scheduler.sh
source ./scripts/cloud-node.sh

function run() {
  run_default_scheduler > logs/kube_schedule.txt 2> logs/kube_schedule_err.txt
#  run_random_scheduler > logs/random_scheduler.txt 2> logs/random_scheduler.txt
#  run_biggest_edge_node_first_scheduler > logs/biggest_edge_node_first_scheduler.txt 2> logs/biggest_edge_node_first_scheduler.txt
#  run_smallest_edge_node_first_scheduler > logs/smallest_edge_node_first_scheduler.txt 2> logs/smallest_edge_node_first_scheduler.txt
#  run_cloud_node_first_scheduler > logs/run_cloud_first_scheduler.txt 2> logs/run_cloud_first_scheduler.txt
}

run;

