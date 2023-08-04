curl -H "Content-Type: application/json" -XGET "127.0.0.1:9200/words/_search?pretty" -d '
{
    "query": {
        "match" : {
            "word": {
                "query": "aplha_centaur", 
                "analyzer": "standard"
            }
        }
    }
}
'
