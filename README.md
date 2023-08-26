# Setup

Deploy elastic:
```
docker compose up
```


Create index:
```
./create_index.sh
```

Send all words in a dictionary
```
./send_words.sh
```

Or send a specific word
```
./q_post.sh
```

At last, execute the query:
```
./q_search <arg>
```

In this approach, aside from edge_ngrams, I'm saving word length to apply "typo fix" only if the word's size is in specific range, but
unfortunately, it anyway fixes words with more typos than needed.
