from datetime import datetime
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator

# uncomment to use for test dependencies installation from packages volume
# from slack import *

with DAG(dag_id='dependency_dag',
         start_date=datetime(2019, 12, 17),
         schedule_interval=None) as dag:
    DummyOperator(task_id='dummy')
