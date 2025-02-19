#! /bin/bash

# Runs the "345M" parameter model

RANK=0
WORLD_SIZE=3

DATA_PATH=/apdcephfs/share_916081/pjli/gptx/data/my-gptx_text_document
CHECKPOINT_PATH=/apdcephfs/share_916081/pjli/gptx/ckpt/


CUDA_VISIBLE_DEVICES=1,2,4 python pretrain_gptx.py \
       --num-layers 24 \
       --hidden-size 1024 \
       --num-attention-heads 16 \
       --micro-batch-size 4 \
       --global-batch-size 8 \
       --seq-length 1024 \
       --max-position-embeddings 1024 \
       --train-iters 500000 \
       --lr-decay-iters 320000 \
       --save $CHECKPOINT_PATH \
       --load $CHECKPOINT_PATH \
       --data-path $DATA_PATH \
       --vocab-file ./data/gptx.model \
       --data-impl mmap \
       --split 9949,50,1 \
       --distributed-backend nccl \
       --lr 0.00015 \
       --min-lr 1.0e-5 \
       --lr-decay-style cosine \
       --weight-decay 1e-2 \
       --clip-grad 1.0 \
       --lr-warmup-fraction .01 \
       --checkpoint-activations \
       --log-interval 100 \
       --save-interval 20000 \
       --eval-interval 1000 \
       --eval-iters 10 \
       --fp16
