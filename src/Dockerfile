FROM docker.elastic.co/elasticsearch/elasticsearch:7.1.1

RUN elasticsearch-plugin install --batch analysis-icu \
 && elasticsearch-plugin install --batch analysis-kuromoji

