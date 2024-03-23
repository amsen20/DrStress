#!/bin/bash


function run_default_scheduler() {
  setup_env_default_scheduler;
  sleep 1m

  execute_scenarios;
  cleanup_env_default_scheduler;
}

function setup_env_default_scheduler() {
  manifests_path="$(pwd)/manifests/kube-scheduler/"
  echo "************************************************************************"
  echo "setting up env for kube-scheduler"
  kubectl apply -f $manifests_path
}

function cleanup_env_default_scheduler() {
  manifests_path="$(pwd)/manifests/kube-scheduler/"
  echo "cleaning up env after kube-scheduler run"
  kubectl delete  -f $manifests_path
  echo "cleaning up complete, going to sleep (5m)"
  sleep 5m
  echo "************************************************************************"
}

