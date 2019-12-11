#!/usr/bin/env bash

./gradlew -Penv=prd publishConfig

docker run --name bonzai_bash --memory='4g' -it -d --volume=`pwd`:/data:rw -w='/data' containers.oracledatacloud.com/odc/bonzai-base-java:8 bash

docker exec --tty bonzai_bash java -DCONSUL_CONFIG_SERVICE_HOST=p-consul-east -Darchaius.deployment.environment=prd -DBONZAI_KEY_PATH=/service/bonzai-key -jar /data/bonzai-api-svc-dropwizard/build/libs/bonzai-api-svc.jar bonzai-adoption
if [ ! -f 'bonzai-adoption.csv' ]; then
    echo "Error generating adoption report."
    exit 1
fi

docker exec --tty bonzai_bash java -DCONSUL_CONFIG_SERVICE_HOST=p-consul-east -Darchaius.deployment.environment=prd -DBONZAI_KEY_PATH=/service/bonzai-key -jar /data/bonzai-api-svc-dropwizard/build/libs/bonzai-api-svc.jar pipeline-deploys
if [ ! -f 'pipeline-deployments.csv' ]; then
    echo "Error generating deployments report."
    exit 1
fi

docker stop bonzai_bash
docker rm bonzai_bash

zip -9 bonzai-reports_`date "+%B-%Y"`.zip bonzai-adoption.csv pipeline-deployments.csv
rm bonzai-adoption.csv pipeline-deployments.csv
