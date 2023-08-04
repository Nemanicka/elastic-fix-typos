#curl -X GET "localhost:9200/my-index-000001/_search?pretty" -H 'Content-Type: application/json' -d'
#{
#  "query": {
#    "match": {
#      "title": {
#        "query": "alpkabet",
#        "analyzer": "standard"
#      }
#    }
#  }
#}
#'
curl -X GET "localhost:9200/my-index-000001/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "match": {
      "title": {
        "query": "alphvvvv",
        "analyzer": "autocomplete"
      }
    }
  }
}
'
