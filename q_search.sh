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
#curl -X GET "localhost:9200/words/_search?pretty" -H 'Content-Type: application/json' -d'
#{
#  "query": {
#    "match": {
#      "word": {
#        "query": '\""$1"\"',
#        "analyzer": "xgrams"
#      }
#    }
#  }
#}
#'

#curl -X GET "localhost:9200/my-index-000001/_search?pretty" -H 'Content-Type: application/json' -d'
#{
#    "query": {
#        "bool": {
#            "should": [
#                {
#                    "match": {
#                        "title":  { 
#                            "query": "a",
#                            "analyzer": "autocomplete"
#                        }
#                    }
#                }
#        ],
#        "minimum_should_match": "90%"
#        }
#    }
#}
#'


curl -X GET "localhost:9200//_search?pretty" -H 'Content-Type: application/json' -d'
{
    "query": {
        "bool" : {
            "must": {
                "match": {
                    "word": {
                        "query": '\""$1"\"',
                        "minimum_should_match": "100%"
                    }
                }
            },
            "filter": [
                {
                    "range": {
                       "word_len": {
                            "gte": 5,
                            "lte": 11
                        }
                    }
                }
            ]
        }
    }
}
'

#curl -X GET "localhost:9200//_search?pretty" -H 'Content-Type: application/json' -d'
#{
#    "query": {
#        "bool" : {
#            "should": {
#                "match": {
#                    "word": {
#                        "query": '\""$1"\"',
#                    }
#                }
#            }
#        },
#                "minimum_should_match": "10%",
#    }
#}
#'
