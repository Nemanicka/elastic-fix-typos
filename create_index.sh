curl -H "Content-Type: application/json" -XPUT "127.0.0.1:9200/_ingest/pipeline/save_word_len?pretty" -d '
{
    "processors": [
        {
            "script": {
                "source": "ctx.word_len = ctx.word.length();"
            }
        }
    ]
}
'

curl -H "Content-Type: application/json" -XPUT "127.0.0.1:9200/words?pretty" -d '
{
        "settings": {
            "analysis": {
                "filter": {
                    "xgrams_filter": {
                        "type": "edge_ngram",
                        "min_gram": 2,
                        "max_gram": 15
                    }
                },
                "analyzer": {
                    "xgrams": {
                        "type": "custom",
                        "tokenizer": "standard",
                        "filter": [
                            "lowercase",
                            "xgrams_filter"
                        ]
                    }
                }
            }
        }, 
        "mappings": {
                "properties": {
                    "word": {
                        "type": "text",
                        "analyzer": "xgrams"
                    }
                }
        }
    }
'
