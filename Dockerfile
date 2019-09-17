FROM java:jre-alpine
RUN apk add --update --no-cache \
	 unzip \
	 wget

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-full-2018-02-27.zip
RUN unzip stanford-corenlp-full-2018-02-27.zip && \
	rm stanford-corenlp-full-2018-02-27.zip

WORKDIR stanford-corenlp-full-2018-02-27

RUN wget http://nlp.stanford.edu/software/stanford-french-corenlp-2018-02-27-models.jar

RUN export CLASSPATH="`find . -name '*.jar'`"

CMD java -cp "*" -mx4g edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port $PORT
