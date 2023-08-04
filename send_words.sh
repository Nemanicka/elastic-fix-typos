#curl -XPOST "http://localhost:9200/example/_bulk" -H "Content-Type: application/json" -d '
#{ "index": { "_index": "vocabulary" } }
#{ "word": "second" }
#{ "index": { "_index": "vocabulary" } }
#{ "word": "try" }
#'
words_file="words_alpha_test.txt"

#req="curl -XPOST 'http://localhost:9200/example/_bulk' -H 'Content-Type: application/json' -d '\n"

c=0

body=""

while IFS= read -r line; do
    ((c=c+1))
    if (( c % 1 == 0 )); then
        echo $c
        req="curl -XPOST 'http://localhost:9200/words/_bulk' -H 'Content-Type: application/json' -d '\n"
        req+=$body
        req+="'"
        freq=$(printf "%b" "$req")
        echo $freq > gen_req.sh
        eval "$freq"
        body=""
    fi
    body+="{ \"index\": { \"_index\": \"words\" } }\n"
    body+="{ \"word\": \"${line::-1}\" }\n"
done < "$words_file"

#req+="'"
#freq=$(printf "%b" "$req")
#echo -e $req > gen_req.sh
#eval "$freq"
#eval `echo -e $req`
#reqNL=`echo -e "$req"`

#echo $reqNL

#eval "$req"
