curl -XPOST 'http://localhost:9200/words/_bulk' -H 'Content-Type: application/json' -d ' { "index": { "_index": "words" } } { "word": "gamma_centauru" } '
