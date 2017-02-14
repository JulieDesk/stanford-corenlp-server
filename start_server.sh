#!/bin/bash

# Load config file
. $(dirname "$0")/server_config.cfg

# Starting server
echo "Starting server..."
nohup java -Djava.io.tmpdir="$TMP_DIR" -mx4g -cp "$PROJECT_DIR/*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port $PORT </dev/null &>/dev/null &
sleep 2

# Pre-loading models
echo "Loading EN models..."
wget --post-data "I have sent an invite" "localhost:$PORT/?properties={\"annotators\":\"tokenize,ssplit,pos, parse, depparse\",\"outputFormat\":\"json\"}" -O -

echo "Loading FR models..."
wget --post-data "J envoie une invitation" "localhost:$PORT/?properties={\"annotators\": \"tokenize,ssplit,pos, parse, depparse\", \"parse.model\":\"edu/stanford/nlp/models/lexparser/frenchFactored.ser.gz\", \"pos.model\":\"edu/stanford/nlp/models/pos-tagger/french/french.tagger\",  \"depparse.model\": \"edu/stanford/nlp/models/parser/nndep/UD_French.gz\", \"tokenize.language\":\"fr\",  \"outputFormat\": \"json\"}" -O -

echo "Done."