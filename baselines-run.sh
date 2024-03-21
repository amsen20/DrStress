#!/bin/bash
source ./scripts/default-scheduler.sh
source ./scripts/random-scheduler.sh
source ./scripts/biggest-edge-node-first.sh
source ./scripts/smallest-edge-node-first.sh
source ./scripts/default-scheduler.sh
source ./scripts/cloud-node.sh

function run() {
    run_default_scheduler
    run_random_scheduler
    run_smallest_edge_node_first_scheduler
    run_biggest_edge_node_first_scheduler
    run_cloud_node_first_scheduler
}

run;
