curl -X PUT "localhost:9200/my-index-000001?pretty" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "analysis": {
      "filter": {
        "ac_filter": {
          "type": "ngram",
          "min_ngram": 3,
          "max_ngram": 4
        }
      },
      "analyzer": {
        "autocomplete": {
          "tokenizer": "autocomplete",
          "filter": [
            "lowercase",
            "edge_ngram"
          ]
        },
        "autocomplete_search": {
          "tokenizer": "lowercase"
        }
      },
      "tokenizer": {
        "autocomplete": {
          "type": "edge_ngram",
          "min_gram": 3,
          "max_gram": 4,
          "token_chars": [
            "letter"
          ]
        }
      }
    }
  },
  "mappings": {
    "properties": {
      "title": {
        "type": "text",
        "analyzer": "autocomplete",
        "search_analyzer": "autocomplete_search"
      }
    }
  }
}
'
curl -X PUT "localhost:9200/my-index-000001/_doc/1?pretty" -H 'Content-Type: application/json' -d'
{
  "title": "alphabet" 
}
'
curl -X POST "localhost:9200/my-index-000001/_refresh?pretty"
