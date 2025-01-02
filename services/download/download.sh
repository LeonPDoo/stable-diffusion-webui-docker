#!/usr/bin/env bash

set -Eeuo pipefail

# TODO: maybe just use the .gitignore file to create all of these
mkdir -vp /data/.cache \
  /data/embeddings \
  /data/config/ \
  /data/models/ \
  /data/models/Stable-diffusion \
  /data/models/GFPGAN \
  /data/models/RealESRGAN \
  /data/models/LDSR \
  /data/models/VAE

echo "Downloading, this might take a while..."

#aria2c -x 10 --disable-ipv6 --input-file /docker/links.txt --dir /data/models --continue

mkdir /data/models/unet
wget "https://huggingface.co/LeonP/VF/resolve/main/flux1-dev-fp8.safetensors" -O /data/models/unet/flux1-dev-fp8.safetensors

mkdir /data/models/VAR
wget "https://huggingface.co/LeonP/VF/resolve/main/ae.safetensors" -O /data/models/VAE/ae.safetensors

mkdir /data/models/clip
wget "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors" -O /data/models/clip/t5xxl_fp16.safetensors

wget "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors" -O /data/models/clip/clip_l.safetensors

#echo "Checking SHAs..."
#parallel --will-cite -a /docker/checksums.sha256 "echo -n {} | sha256sum -c"

cat <<EOF
By using this software, you agree to the following licenses:
https://github.com/AbdBarho/stable-diffusion-webui-docker/blob/master/LICENSE
https://github.com/CompVis/stable-diffusion/blob/main/LICENSE
https://github.com/AUTOMATIC1111/stable-diffusion-webui/blob/master/LICENSE.txt
https://github.com/invoke-ai/InvokeAI/blob/main/LICENSE
And licenses of all UIs, third party libraries, and extensions.
EOF
