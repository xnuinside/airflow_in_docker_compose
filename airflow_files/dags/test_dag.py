from datetime import datetime
from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator


with DAG(dag_id="test_dag", start_date=datetime(2019, 11, 28),
         schedule_interval="@daily") as dag:
	DummyOperator(task_id="dummy_task_run")