#curl -XPUT "http://localhost:9200/vocabulary" -H "Content-Type: application/json" -d '
#{
#  "mappings": {
#    "properties": {
#      "word": {
#        "type": "text"
#      }
#    }
#  }
#}'
#curl -H "Content-Type: application/json" -XGET "127.0.0.1:9200/words/_analyze?pretty" -d '
#{
#"analyzer": "autocomplete_analyzer",
#"text": "Database"
#}
#' 
curl -H "Content-Type: application/json" -XPUT "127.0.0.1:9200/words/_mapping/vocabulary?pretty" -d '
{
"mappings": {
"properties" : {
"word": { "type": "text", "analyzer": "autocomplete_analyzer", "search_analyzer": "standard"}
}
}
}
'
