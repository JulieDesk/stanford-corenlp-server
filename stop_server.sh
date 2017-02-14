#!/bin/bash

# Load config file
. $(dirname "$0")/server_config.cfg

if [ ! -e "$TMP_DIR/corenlp.shutdown" ]; then
    echo "CoreNLP server is not running"
else
    KEY=`cat "$TMP_DIR/corenlp.shutdown"`
    curl "localhost:$PORT/shutdown?key=$KEY"
    echo "CoreNLP server stopped"
fi