curl -H "Content-Type: application/json" -XPUT "127.0.0.1:9200/words?pretty" -d '
{
    "settings": {
        "analysis": {
            "filter": {
                "ngram_filter": {
                    "type": "edge_ngram",
                    "min_gram": 1,
                    "max_gram": 20
                }
            },
            "analyzer": {
                "ngram_analyzer": {
                    "type": "custom",
                    "tokenizer": "standard",
                    "filter": [ "lowercase", "ngram_filter"]
                }
            }
        }
    },
    "words": {
    "mappings": {
    "vocabulary": {
        "properties" : {
            "word": { 
                "type": "text", 
                "analyzer": "ngram_analyzer", 
                "search_analyzer": "standard"
             }
         }
    }
    }
    }
}
'
