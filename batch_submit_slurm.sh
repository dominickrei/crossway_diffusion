#!/bin/bash

config_paths=("can_ph" "can_mh" "lift_ph" "lift_mh" "square_ph" "square_mh" "transport_ph" "transport_mh" "tool_hang_ph")
config_paths=("transport_ph" "transport_mh")
dec_type=typea
seed=42


for config_path in "${config_paths[@]}"; do
    sbatch --export=type=$dec_type,seed=$seed,config_path=$config_path ./slurm_train.sh
done

# config_paths2=("can_ph" "can_mh" "lift_ph" "lift_mh" "square_ph" "square_mh" "transport_ph" "transport_mh" "tool_hang_ph")

# for config_path in "${config_paths[@]}"; do
#     sbatch --export=type=$dec_type,seed=$seed,config_path=$config_path ./slurm_train.sh
# done
