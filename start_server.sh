#!/bin/bash

# Load config file
. $(dirname "$0")/server_config.cfg

# Starting server
echo "Starting server..."
nohup java --add-modules java.xml.bind -Djava.io.tmpdir="$TMP_DIR" -mx4g -cp "$PROJECT_DIR/*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port $PORT </dev/null &>/dev/null &

echo "Waiting for server to start..."
while ! nc -z localhost $PORT; do
  sleep 1 # wait for 1/10 of the second before check again
  echo "Not started yet..."
done

# Pre-loading models
echo "Loading EN models..."
wget --post-data "I have sent an invite" "localhost:$PORT/?properties={\"annotators\":\"tokenize,ssplit,pos,parse,depparse,ner\",\"outputFormat\":\"json\"}" -vvvv -O -

echo "Loading FR models..."
wget --post-data "J envoie une invitation" "localhost:$PORT/?properties={\"annotators\":\"tokenize,ssplit,pos,parse,depparse,ner\", \"parse.model\":\"edu/stanford/nlp/models/lexparser/frenchFactored.ser.gz\", \"pos.model\":\"edu/stanford/nlp/models/pos-tagger/french/french.tagger\",  \"depparse.model\": \"edu/stanford/nlp/models/parser/nndep/UD_French.gz\", \"tokenize.language\":\"fr\",  \"outputFormat\": \"json\"}" -O -

echo "Done."
