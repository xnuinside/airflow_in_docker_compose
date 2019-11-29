FROM puckel/docker-airflow:1.10.6
RUN pip install --user psycopg2-binary
ENV AIRFLOW_HOME=/usr/local/airflow
COPY ./airflow.cfg /usr/local/airflow/airflow.cfg
# or ./airflow_celeryexecutor.cfg /usr/local/airflow/airflow.cfg if you need .cfg with CeleryExecutor
