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
function setup_genny() {
   cd genny

   python3 -m venv .venv
   source ./.venv/bin/activate
   python3 -m pip install -r requirements.txt

   cd ..
}

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
  mkdir logs/genny logs/move logs/ecmus logs/biggest-fitting logs/smallest-fitting logs/setup_genny;
  setup_genny 1> logs/setup_genny/setup_genny.txt 2> logs/setup_genny/setup_genny_err.txt;

  for ((i=1; i<=$iteration_count;i++)) ; do
    create_scenario_files 1> logs/genny/"genny_${i}.txt" 2> logs/ecmus/"genny_err_${i}.txt";
    move_scenario_files 1> logs/move/"move_${i}.txt" 2> logs/move/"move_${i}_err.txt";

    run_ecmus_scheduler 1> logs/ecmus/"ecmus_scheduler_${i}".txt \
                        2> logs/ecmus/"ecmus_scheduler_${i}_err.txt";
#    sleep 5m;

    run_biggest_edge_node_first_scheduler 1> logs/biggest-fitting/"biggest_edge_node_first_scheduler_${i}.txt" \
                                          2> logs/biggest-fitting/"biggest_edge_node_first_scheduler_err_${i}.txt";
#    sleep 5m;

    run_smallest_edge_node_first_scheduler 1> logs/smallest-fitting/"smallest_edge_node_first_scheduler_${i}.txt" \
                                           2> logs/smallest-fitting/"smallest_edge_node_first_scheduler_err_${i}.txt";
#    sleep 5m;
  done

}

run;

