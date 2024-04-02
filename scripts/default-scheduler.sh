#!/bin/bash


function run_default_scheduler() {
  execute_scenarios_default_scheduler;
}

function execute_scenarios_default_scheduler() {
  manifests_path="$(pwd)/manifests/kube-scheduler/"
  echo "execute_scenarios for kube-schedule"
  run_normal_scenarios $manifests_path
  run_wavy_scenarios $manifests_path
}

