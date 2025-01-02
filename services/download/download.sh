#!/usr/bin/env bash

wget "https://huggingface.co/LeonP/VF/resolve/main/flux1-dev-fp8.safetensors" -O unet/flux1-dev-fp8.safetensors

wget "https://huggingface.co/LeonP/VF/resolve/main/ae.safetensors" -O VAE/ae.safetensors

wget "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors" -O clip/t5xxl_fp16.safetensors

wget "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors" -O clip/clip_l.safetensors
