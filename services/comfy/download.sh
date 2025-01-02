#!/usr/bin/env bash

set -Eeuo pipefail

# TODO: maybe just use the .gitignore file to create all of these
mkdir -vp /data/.cache \
  /data/embeddings \
  /data/config/ \
  /data/models/ \
  /data/custom_nodes/ \

echo "Downloading Models, this might take a while..."

#aria2c -x 10 --disable-ipv6 --input-file /docker/links.txt --dir /data/models --continue

#mkdir /data/models/unet
#wget "https://huggingface.co/LeonP/VF/resolve/main/flux1-dev-fp8.safetensors" -O /data/models/unet/flux1-dev-fp8.safetensors

mkdir /data/models/VAE
wget "https://huggingface.co/LeonP/VF/resolve/main/ae.safetensors" -O /data/models/VAE/ae.safetensors

#mkdir /data/models/clip
#wget "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors" -O /data/models/clip/t5xxl_fp16.safetensors

#wget "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors" -O /data/models/clip/clip_l.safetensors


# Custom Nodes:
######################################################

echo "Downloading and Installing Custom Nodes, this might take a while..."

git clone https://github.com/ltdrdata/ComfyUI-Manager
pip install -r /data/custom_nodes/ComfyUI-Manager/requirements.txt
