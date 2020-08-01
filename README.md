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


-postgresql -d local

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
