curl -X PUT "localhost:9200/words/_doc/1?pipeline=save_word_len&pretty" -H 'Content-Type: application/json' -d'
{
  "word": "alphabeta" 
}
'
