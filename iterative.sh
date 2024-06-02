#!/bin/sh

source ./scripts/ecmus-scheduler.sh
source ./scripts/biggest-edge-node-first.sh
source ./scripts/smallest-edge-node-first.sh

iteration_count=1
function create_scenario_files() {
  git submodule update --recursive --remote
  cd genny
  rm -rf ./out
  bash basic.sh
  cd ..
}

function move_scenario_files() {
  rm -rf ./scenarios
  mkdir ./scenarios
  mkdir ./scenarios/normal
  cp ./genny/out/normal/* ./scenarios/normal/
}

function run() {
  for ((i=1; i<=$iteration_count;i++)) ; do
    echo "create scenario files"
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

    echo "---------------"
  done

}

run;

