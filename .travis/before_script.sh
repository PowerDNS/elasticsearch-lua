#!/bin/bash

echo 'elasticsearch version ' && curl ${CACERT_PATH} ${ELASTIC_CREDS} ${ES_TEST_PROTOCOL}://localhost:${ES_TEST_PORT}/
curl -XPUT ${CACERT_PATH} ${ELASTIC_CREDS} "${ES_TEST_PROTOCOL}://localhost:${ES_TEST_PORT}/elasticsearch-lua-reindex-index-2"
curl -XPUT ${CACERT_PATH} ${ELASTIC_CREDS} "${ES_TEST_PROTOCOL}://localhost:${ES_TEST_PORT}/elasticsearch-lua-reindex-index-1"
curl -XPUT ${CACERT_PATH} ${ELASTIC_CREDS} "${ES_TEST_PROTOCOL}://localhost:${ES_TEST_PORT}/elasticsearch-lua-test-index"
echo 'Ensure elasticsearch has enough fields configured'
curl -v -XPUT ${CACERT_PATH} ${ELASTIC_CREDS} ${ES_TEST_PROTOCOL}://localhost:${ES_TEST_PORT}/_settings -d '{ "index.mapping.total_fields.limit": 10000 }' -H 'Content-Type:application/json'
