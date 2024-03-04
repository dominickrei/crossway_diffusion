#! /bin/bash


# ===== SLURM OPTIONS =====
#SBATCH --job-name="diffusion-policy-can_ph-crossway_vit-t_backbone"
#SBATCH --partition=GPU
#SBATCH --gres=gpu:A100:1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=64GB
#SBATCH --time=72:00:00
#SBATCH --output=./slurm_jobs/%j.out
##SBATCH --mail-user=dreilly1@uncc.edu
##SBATCH --mail-type=END
##SBATCH --mail-type=FAIL

# ==== Main ======
module load anaconda3
module load cuda
module list

conda init bash
source ~/.bashrc
conda activate robo
echo Active env: $CONDA_DEFAULT_ENV

echo $(nvidia-smi)

echo started running script

EGL_DEVICE_ID=0 python /users/dreilly1/Projects/robotics/crossway_diffusion/train.py --config-dir=config/can_ph/ --config-name=typea.yaml training.seed=42

echo finished running script
