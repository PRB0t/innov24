#TODO

## WSO2IS:
```
Pulling db (mysql:5.6.23)...
5.6.23: Pulling from library/mysql
[DEPRECATION NOTICE] registry v2 schema1 support will be removed in an upcoming release. Please contact admins of the docker.io registry NOW to avoid future disruption.
```


## Github
push

  mysql:
    image: mysql:5.7.20
    container_name: wso2ei-mysql
    ports:
      - 3306
    environment:
        MYSQL_ROOT_PASSWORD: root
    volumes:
      # mounting MySQL init scripts
      - ./mysql/scripts:/docker-entrypoint-initdb.d
      # mounting custom configurations
      - ./mysql/conf/my.cnf:/etc/mysql/conf.d/my.cnf
    healthcheck:
      test: ["CMD", "mysqladmin" ,"ping", "-uroot", "-proot"]
      interval: $INTERVALLE_MYSQL
      timeout: $TIMEOUT_MYSQL
      retries: $RETRIES_MYSQL
      start_period: $START_MYSQL
  wso2ei-analytics-worker:
    image: wso2/wso2ei-analytics-worker:6.5.0
    container_name: wso2ei-analytics-worker
    ports:
      - 9091:9091
      - 9444:9444
    healthcheck:
      test: ["CMD", "nc", "-z","localhost", "9444"]
      interval: $INTERVALLE_ANALYTICS_WORKERS
      timeout: $TIMEOUT_ANALYTICS_WORKERS
      retries: $RETRIES_ANALYTICS_WORKERS
      start_period: $START_ANALYTICS_WORKERS
    volumes:
      # mounting configurations
      - ./worker:/home/wso2carbon/wso2-config-volume
    depends_on:
      mysql:
        condition: service_healthy
  wso2ei-analytics-dashboard:
    image: wso2/wso2ei-analytics-dashboard:6.5.0
    container_name: wso2ei-analytics-dashboard
    ports:
      - 9643:9643
    healthcheck:
      test: ["CMD", "nc", "-z","localhost", "9643"]
      interval: $INTERVALLE_ANALYTICS_DASHBOARD
      timeout: $TIMEOUT_ANALYTICS_DASHBOARD
      retries: $RETRIES_ANALYTICS_DASHBOARD
      start_period: $START_ANALYTICS_DASHBOARD
    depends_on:
      mysql:
        condition: service_healthy
    volumes:
      - ./dashboard:/home/wso2carbon/wso2-config-volume
  wso2ei-business-process:
    image: wso2/wso2ei-business-process:6.5.0
    container_name: wso2ei-business-process
    ports:
      - 9445:9445
    healthcheck:
      test: ["CMD", "nc", "-z","localhost", "9445"]
      interval: $INTERVALLE_BUSINESS_PROCESS
      timeout: $TIMEOUT_BUSINESS_PROCESS
      retries: $RETRIES_BUSINESS_PROCESS
      start_period: $START_BUSINESS_PROCESS
    volumes:
      # mounting configurations
      - ./business-process:/home/wso2carbon/wso2-config-volume
    depends_on:
      mysql:
        condition: service_healthy
      wso2ei-analytics-worker:
        condition: service_healthy
      wso2ei-analytics-dashboard:
        condition: service_healthy
  wso2ei-broker:
    image: wso2/wso2ei-broker:6.5.0
    container_name: wso2ei-broker
    hostname: wso2ei-broker
    ports:
      - 9446:9446
      - 5675:5675
      - 8675:8675
      - 1886:1886
      - 8836:8836
      - 7614:7614
    healthcheck:
      test: ["CMD", "nc", "-z","localhost", "9446"]
      interval: $INTERVALLE_BROKER
      timeout: $TIMEOUT_BROKER
      retries: $RETRIES_BROKER
      start_period: $START_BROKER
    volumes:
      # mounting configurations
      - ./broker:/home/wso2carbon/wso2-config-volume
    depends_on:
      mysql:
        condition: service_healthy
      wso2ei-analytics-worker:
        condition: service_healthy
      wso2ei-analytics-dashboard:
        condition: service_healthy
      wso2ei-business-process:
        condition: service_healthy
  wso2ei-integrator:
    image: wso2/wso2ei-integrator:6.5.0
    container_name: wso2ei-integrator
    ports:
      - 9443:9443
      - 8243:8243
      - 8280:8280
    healthcheck:
      test: ["CMD", "nc", "-z","localhost", "9443"]
      interval: $INTERVALLE_INTEGRATOR
      timeout: $TIMEOUT_INTEGRATOR
      retries: $RETRIES_INTEGRATOR
      start_period: $START_INTEGRATOR
    volumes:
      # mounting configurations
      - ./integrator:/home/wso2carbon/wso2-config-volume
    depends_on:
      mysql:
        condition: service_healthy
      wso2ei-analytics-worker:
        condition: service_healthy
      wso2ei-analytics-dashboard:
        condition: service_healthy
      wso2ei-business-process:
        condition: service_healthy
      wso2ei-broker:
        condition: service_healthy

# REST
contact friends on discord
libjack-jackd2-0 removed --> installing mycroft
regler edf et rationaliser les depenses de l'appart
arreter les frais (lgd, etc.)

# DOCKER KUBERTIKE
convertir le dockercompose en kubernetike
