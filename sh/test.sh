#!/usr/bin/env bash

file_path=$1

file_path=$(cd $(dirname $file_path) && pwd)/$(basename $file_path)

contest_id=$(echo $file_path | sed -E 's|.*/([^/]+)/src/bin/[^/]+|\1|')
filename=$(basename $file_path)
task_label=${filename%.*}

echo "Testing: contest=$contest_id, task=$task_label"
cd $contest_id
oj t -c "cargo run --color always --bin $task_label" -d "testcases/$task_label"