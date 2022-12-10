# Official Docker-Compose
Pay attention that in current time already exists official Docker-Compose.yml https://airflow.apache.org/docs/apache-airflow/stable/start/docker.html (maybe better to use it)

### Apache Airflow version 2.0.0
(2.0 not 100% bacward compatible to 1.10+ this is because I move it to separate compose file):

By default now RBAC is turn on and this mean, that to use Airflow UI you need create user first, for this in db_init service was added also command to create default user:
>> *airflow users create --firstname admin --lastname admin --email admin --password admin --username admin --role Admin*

Change your user password and login as you want. By default it is login: admin, password: admin.

![New Apache Airflow 2.0](/docs/img/2.0.png?raw=true "Apache Airflow 2.0")

**Note:**
If you will run docker-compose for 2nd and more times in init_db you will see log:

```
    initdb_1     | admin already exist in the db
    airflow_in_docker_compose_initdb_1 exited with code 0
```

**[docker-compose-with-celery-executor.yml](docker-compose-2.0-with-celery-executor.yml)**

**NOTE: if you previous run Airflow 1.10 - remove your DB volume files before run 2.0 or change db init command to db upgrade.**

```bash

    git clone https://github.com/xnuinside/airflow_in_docker_compose
    cd airflow_in_docker_compose
    
    docker-compose -f docker-compose-2.0-with-celery-executor.yml up --build

```
### Apache Airflow 2.* with 2 Celery Workers (or more)

Because was issue about run Apache 2.0 with 2 Celery workers I think will be not bad to have docker-compose with such set up. 

I added it as separate compose file:

**[docker-compose-2.0-with-celery-executor-2-workers.yml](docker-compose-2.0-with-celery-executor-2-workers.yml)**

To check that your workers up&run well - use flower UI (it exists in docker-compose setup):
![Flower UI with 2 workers](/docs/img/flower.png?raw=true "Flower UI with 2 workers")


### Apache Airflow version 1.10.14:
```bash

    git clone https://github.com/xnuinside/airflow_in_docker_compose
    cd airflow_in_docker_compose

    # to run airflow with 1 Celery worker
    docker-compose up --build

```

Wait until all services will succesfull up & open http://localhost:8080/admin. 

### FAQ & Help

Exists different behaviour of Docker Compose on different OS relative to file system specifications, work with access rights & etc. This docker-compose file tested by me in MacOS mostly, some time I can up & run it on wsl (but not each update).

In issues you can find some cases when something goes wrong and maybe it will help you to solve own issue.

**Ubuntu Issues:**

1. [Permission denied error](https://github.com/xnuinside/airflow_in_docker_compose/issues/4)

**WSL Issues:**

1. [No DAGs in UI in Airflow 2.0 & failed airflow init on second runs](https://github.com/xnuinside/airflow_in_docker_compose/issues/10) - Not resolved yet

Also at the end of this README.md file exists section https://github.com/xnuinside/airflow_in_docker_compose#for-windows-10-users with some information wor WSL users. Maybe it also can help. 

**Problem with connection to PostgreSQL (at first time run)**:

If you share low count of resources for Docker or you have a machine with low perfomance, up&run PostgreSQL for the first time can take a significant time. And you can see the errors like this:

``` 
Is the server running on host "postgres" (172.25.0.3) and accepting
initdb_1     |  TCP/IP connections on port 5432?
```

In normal behaviour - in docker-compose I added autorestarts so after 10-15 secs all servers will be up&run, but sometimes 3 retries can be not enough. 

I can recommend in this case at first time run postgres service separate until you will see information that Postgres is up & ready to accept connections.:

```
    docker-compose -f docker-compose-2.0-with-celery-executor-2-workers.yml up --build postgres
```

If you had any troubles & you successfully solve it - please open an issue with solution, I will add it to this readme.md file. Thank you!


# Apache Airflow with Docker Compose examples
**UPD from July 2020: 
Those articles was created before release of official Apache Airflow Docker image and they use puckel/docker-airflow. 
Now, already exist official image apache/airflow. So this docker-compose files became 'legacy' 
and all sources moved to 'docker_with_puckel_image'.
Main Docker Compose Cluster based on  apache/airflow Image**

Docker-compose config based on official image (required docker-compose version 3.7 and higher):

**[docker-compose-with-celery-executor.yml](docker-compose-with-celery-executor.yml)**


And env file with config setting for Airflow (used in docker-compose-with-celery-executor.yml):
**[.env](.env)**


Source files for article with description on Medium.

**Apache Airflow with LocalExecutor:**
    <https://medium.com/@xnuinside/quick-guide-how-to-run-apache-airflow-cluster-in-docker-compose-615eb8abd67a>
    
**Apache Airflow with CeleryExecutor:**
    <https://medium.com/@xnuinside/quick-tutorial-apache-airflow-with-3-celery-workers-in-docker-composer-9f2f3b445e4>

**Install Python dependencies to docker-compose cluster without re-build images**
    <https://medium.com/@xnuinside/install-python-dependencies-to-docker-compose-cluster-without-re-build-images-8c63a431e11c>


![Main Apache Airflow UI](/docs/img/main.png?raw=true "Main Apache Airflow UI")
![Version](/docs/img/version.png?raw=true "Version Screen")

### 10.12.2022:
1. Updated version to 2.5.0

### 20.09.2022:
1. Updated version to 2.4.0
2. all files with version 1.* & puckel images moved to "archive" folder
3. 2* became default version
4. Updated docker-compose version

### 20.09.2022:
1. Updated version to 2.4.0
2. all files with version 1.* & puckel images moved to "archive" folder
3. 2* became default version
4. Updated docker-compose version

### 03.02.2021:
1. In docker-compose files for Airflow 2.0 **scheduler** service restart police changed to 'any' because for some reason it exist with 0 if error in DB and init is not finished yet, so restart policy 'on-failure' does not works. 
2. Added example for Apached Airflow 2.0 with 2 workers. 

### 02.02.2021:
1. Added FAQ section with issues that might help 
2. Updated fernet key in .env


### 18.12.2020:
1. Added separate docker-compose file for Apache Airflow 2.0 version


### 16.12.2020:
1. Update Apache Airflow version to 1.10.14
2. Change  init db command to "airflow db init"


### 29.11.2020:
1. Update Apache Airflow version to 1.10.12
2. Update PostgreSQL DB to 13.1
3. Added restart_policy to services in docker-compose


### 07.2020:
1. All compose files with puckel_image moved to docker_with_puckel_image
2. Creted docker-compose config based on official image (required docker-compose version 3.7 and higher):
**[docker-compose-with-celery-executor.yml](docker-compose-with-celery-executor.yml)**
And env file with config setting for Airflow (used in docker-compose-with-celery-executor.yml):
**[.env](.env)**
3. At the bottom of readme added note for Windows 10 users


### 21.07.2020:
1. Docker Compose files with puckel images moved to docker_with_puckel_image
2. Added docker-compose-with-celery.yml based on official image.

### 18.12.19 changes:
1. added samples for article https://medium.com/@xnuinside/install-python-dependencies-to-docker-compose-cluster-without-re-build-images-8c63a431e11c (docker-compose-volume-packages.yml, packages.pth, added commented lines to Dockerfile)
2. added .dockerignore

### 29.11.19 changes:
1. Apache Airflow Image was updated to version 1.10.6
2. Added test_dag into airflow_files

## For Windows 10 Users
If you try to work on Windows 10 & run docker-compose on it you will got an issue for **postgres** service:

FATAL:  data directory "/var/lib/postgresql/data/pgdata" has wrong ownership

To solve this issue you must do additional steps (unfortanutely there is no more quick workaround, check: https://forums.docker.com/t/data-directory-var-lib-postgresql-data-pgdata-has-wrong-ownership/17963/23 and https://forums.docker.com/t/trying-to-get-postgres-to-work-on-persistent-windows-mount-two-issues/12456/5?u=friism):

1. Create docker volume:

    docker volume create --name volume-postgresql -d local


2. in docker-compose.yml:
    2.1 add volume at thetop of the file, under 'networks' defining like this:

    ``` 
    networks:
      airflow:

    volumes:
      volume-postgresql:
        external: true
    ```

    2.2 change *postgres* service volumes:

        was:  
    ```
      - ./database/data:/var/lib/postgresql/data/pgdata
      - ./database/logs:/var/lib/postgresql/data/log
    ```

        become:
    ```
      - volume-postgresql:/var/lib/postgresql/data/pgdata
      - volume-postgresql:/var/lib/postgresql/data/log
    ```

Or use WSL and run docker under it. 

If you never use docker with mount local folders as volumes under WSL possible you need first follow up this article: https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly#ensure-volume-mounts-work because by default volumes are not mounted correct and you will not see any 'dags' in Airflow. 
