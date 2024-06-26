#!/bin/sh

source ./scripts/utils.sh
source ./scripts/ecmus-no-migration.sh
source ./scripts/ecmus-scheduler.sh
source ./scripts/default-scheduler.sh
source ./scripts/random-scheduler.sh
source ./scripts/biggest-edge-node-first.sh
source ./scripts/smallest-edge-node-first.sh
source ./scripts/default-scheduler.sh
source ./scripts/cloud-node.sh
source ./scripts/ecmus-no-qos.sh

iteration_count=10
function create_scenario_files() {
  cd genny
  rm -rf ./out
  bash basic.sh
  cd ..
}

function move_scenario_files() {
  rm -rf ./scenarios
  mkdir ./scenarios
  mkdir ./scenarios/normal
  cp -r ./genny/out/normal/* ./scenarios/normal/
}

function run() {
  for ((i=1; i<=$iteration_count;i++)) ; do
    create_scenario_files;
    move_scenario_files;

    run_ecmus_scheduler 1> logs/ecmus/"ecmus_scheduler_${i}".txt \
                        2> logs/ecmus/"ecmus_scheduler_${i}_err.txt";
    sleep 5m;

    run_biggest_edge_node_first_scheduler 1> logs/biggest-fitting/"biggest_edge_node_first_scheduler_${i}.txt" \
                                          2> logs/biggest-fitting/"biggest_edge_node_first_scheduler_err_${i}.txt";
    sleep 5m;

    run_smallest_edge_node_first_scheduler 1> logs/smallest-fitting/"smallest_edge_node_first_scheduler_${i}.txt" \
                                           2> logs/smallest-fitting/"smallest_edge_node_first_scheduler_err_${i}.txt";
    sleep 5m;
  done

}

run;

