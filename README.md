A packaged server for Stanford core nlp
See http://stanfordnlp.github.io/CoreNLP/ for documentation

Requirements

java runtime environment >= 8


Setup server:
```
sh server_setup.sh
```

Start server:
```
sh start_server.sh
```

Stop server:
```
sh stop_server.sh
```

Edit configuration:
```
# server_config.cfg
VERSION_NAME=stanford-corenlp-full-2016-10-31
FILE_SERVER=http://nlp.stanford.edu/software/
PORT=9000
CURRENT_DIR=$(dirname "$0")
TMP_DIR=$CURRENT_DIR
PROJECT_DIR=$CURRENT_DIR/$VERSION_NAME

FRENCH_MODELS_JAR=http://nlp.stanford.edu/software/stanford-french-corenlp-2016-10-31-models.jar
```


Deploy on heroku
```
heroku container:push web
```
