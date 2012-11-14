# Test : CouchDB + Elasticseach

## Install

````bash
git clone git://github.com/Benjamin-Ds/test-couchdb-elasticsearch.git
cd test-couchdb-elasticsearch
git submodule update --init
vagrant up
```

## Usage

### Create a CouchDB database

```bash
curl -X PUT 'http://127.0.0.1:5984/my_db'
```

### Add some datas

```bash
curl -H 'Content-Type: application/json' -X POST 'http://127.0.0.1:5984/my_db' -d '{"name":"foo"}'
curl -H 'Content-Type: application/json' -X POST 'http://127.0.0.1:5984/my_db' -d '{"name":"bar"}'
curl -H 'Content-Type: application/json' -X POST 'http://127.0.0.1:5984/my_db' -d '{"name":"baz"}'
```

### Configure ElasticSearch to start indexing

```bash
curl -XPUT 'http://127.0.0.1:9200/_river/my_db/_meta' -d '{
    "type" : "couchdb",
    "couchdb" : {
        "host" : "127.0.0.1",
        "port" : 5984,
        "db" : "my_db",
        "filter" : null
    },
    "index" : {
        "index" : "my_db",
        "type" : "my_db",
        "bulk_size" : "100",
        "bulk_timeout" : "10ms"
    }
}'
```

### Show the index

```bash
curl 'http://127.0.0.1:9200/my_db/_search?pretty=true'
```

### Search

```bash
curl 'http://127.0.0.1:9200/my_db/_search?q=foo&pretty=true'
```

## Ressources

* [CouchDB River Plugin for ElasticSearch](https://github.com/elasticsearch/elasticsearch-river-couchdb)
* [Searchable CouchDB](http://www.elasticsearch.org/blog/2010/09/28/the_river_searchable_couchdb.html)
* [Replacing CouchDB views with elasticsearch](http://daemon.co.za/2012/05/replacing-couchdb-views-with-elasticsearch/)