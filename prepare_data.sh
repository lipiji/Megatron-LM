python tools/preprocess_data.py \
    --input /dockerdata/pjli/data/language_model/bert_newdata/data.txt \
    --output-prefix /apdcephfs/share_916081/pjli/gptx/my-gptx \
    --vocab ./data/gptx.model \
    --dataset-impl mmap \
    --tokenizer-type GPTXTokenizer \
    --workers 64 \
    --append-eod
    
    
#python tools/preprocess_data.py \
#    --input /dockerdata/pjli/data/language_model/zhwiki/zhwiki_json.txt \
#    --output-prefix my-bert \
#    --dataset-impl mmap \
#    --tokenizer-type BertWordPieceLowerCase \
#    --split-sentences

