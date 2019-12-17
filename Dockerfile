FROM puckel/docker-airflow:1.10.6
RUN pip install --user psycopg2-binary
ENV AIRFLOW_HOME=/usr/local/airflow

# uncomment next 2 lines if you want to use 'docker-compose-volume-packages.yml'
# RUN mkdir /usr/local/airflow/packages
# COPY ./packages.pth /usr/local/lib/python3.7/site-packages

COPY ./airflow.cfg /usr/local/airflow/airflow.cfg
# or change to ./airflow_celeryexecutor.cfg /usr/local/airflow/airflow.cfg
# if you need .cfg with CeleryExecutor
