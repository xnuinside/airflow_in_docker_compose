FROM puckel/docker-airflow:1.10.3
RUN pip install --user psycopg2-binary
COPY ./airflow.cfg /usr/local/airflow/airflow.cfg
# or ./airflow_celeryexecutor.cfg /usr/local/airflow/airflow.cfg if you need .cfg with CeleryExecutor
