#!/usr/bin/env bash

file_path=$1

file_path=$(cd $(dirname $file_path) && pwd)/$(basename $file_path)

contest_id=$(echo $file_path | sed -E 's|.*/([^/]+)/src/bin/[^/]+|\1|')
filename=$(basename $file_path)
task_label=${filename%.*}
task_id=${contest_id}_${task_label}
submit_path=$contest_id/src/bin/$filename

echo "Submitting: $submit_path (contest=$contest_id, task=$task_id)"
acc submit -c "$contest_id" -t "$task_id" "$submit_path"