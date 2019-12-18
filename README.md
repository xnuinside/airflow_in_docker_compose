# Apache Airflow with Docker Compose example

*UPGRADE UPPER 1.10.5 be AWARE:*
You need to define 'default_pool' for task instances and set slots to it. About 1000, for example. 
This was not needed previous and default_poll was exist. But now you need to create it manually. So just go to UI, Admin -> Pools (http://localhost:8080/admin/pool/) and press *Create*. Create pool with name 'default_pool' and slots, for example 100 or 1000. 

Source files for article with description on Medium

**Apache Airflow with LocalExecutor:**
    <https://medium.com/@xnuinside/quick-guide-how-to-run-apache-airflow-cluster-in-docker-compose-615eb8abd67a>
    
**Apache Airflow with CeleryExecutor:**
    <https://medium.com/@xnuinside/quick-tutorial-apache-airflow-with-3-celery-workers-in-docker-composer-9f2f3b445e4>

**Install Python dependencies to docker-compose cluster without re-build images**
    <https://medium.com/@xnuinside/install-python-dependencies-to-docker-compose-cluster-without-re-build-images-8c63a431e11c>


![Main Apache Airflow UI](/docs/img/main.png?raw=true "Main Apache Airflow UI")
![Version](/docs/img/version.png?raw=true "Version Screen")

### 18.12.19 changes:
1. added samples for article https://medium.com/@xnuinside/install-python-dependencies-to-docker-compose-cluster-without-re-build-images-8c63a431e11c (docker-compose-volume-packages.yml, packages.pth, added commented lines to Dockerfile)
2. added .dockerignore

### 29.11.19 changes:

1. Apache Airflow Image was updated to version 1.10.6
2. Added test_dag into airflow_files

