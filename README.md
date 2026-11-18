
# Distributed Network Intrusion Detection System (NIDS)

**A distributed Network Intrusion Detection System using Hadoop, Apache Spark, Docker, and Machine Learning.**

**Project Status:** In Progress

## 1. Overview

This project aims to design and implement a distributed Network Intrusion Detection System (NIDS) capable of processing large volumes of network traffic data and identifying potentially malicious activities.

The platform is designed around a distributed architecture using Hadoop for data storage and resource management, and Apache Spark for large-scale data processing and intrusion detection.

The current implementation focuses on building and validating the distributed infrastructure. Dataset integration, data processing, and intrusion detection models will be developed in subsequent phases.

## 2. Objectives

- Build a distributed processing environment for network security data.
- Deploy a Hadoop cluster for distributed storage and resource management.
- Use Apache Spark for scalable data processing.
- Analyze network traffic datasets and identify suspicious patterns.
- Develop and evaluate machine learning models for intrusion detection.
- Assess model performance using relevant evaluation metrics.

## 3. Architecture

The current infrastructure consists of two Docker containers:

- **Master Node:** Hosts the HDFS NameNode, YARN ResourceManager, and Spark History Server.
- **Worker Node:** Hosts the HDFS DataNode and YARN NodeManager, and executes distributed tasks.

```text
                 Ubuntu Server
                      |
                    Docker
                      |
               Docker Network
                      |
             +----------------+
             |   Master Node  |
             |----------------|
             | HDFS NameNode  |
             | YARN Resource  |
             | Manager        |
             | Spark History  |
             | Server         |
             +----------------+
                      |
                HDFS / YARN
                      |
             +----------------+
             |   Worker Node  |
             |----------------|
             | HDFS DataNode  |
             | YARN NodeManager|
             | Spark Executor |
             +----------------+
```

## 4. Technologies

| Technology | Purpose |
|---|---|
| Ubuntu Server | Host operating system |
| Docker | Containerization |
| Docker Compose | Cluster deployment |
| Hadoop 3.3.6 | Distributed storage and resource management |
| HDFS | Distributed file system |
| YARN | Cluster resource management |
| Apache Spark 3.5.1 | Distributed data processing |
| Java 11 | Runtime environment |
| Python | Data processing and machine learning |

## 5. Project Structure

```text
nids-project/
├── config/
│   ├── hadoop/
│   │   ├── core-site.xml
│   │   ├── hdfs-site.xml
│   │   ├── mapred-site.xml
│   │   └── yarn-site.xml
│   └── spark/
│       ├── spark-defaults.conf
│       └── spark-env.sh
│
├── docker/
│   ├── Dockerfile
│   └── scripts/
│       ├── start-master.sh
│       └── start-worker.sh
│
├── docker-compose.yml
├── .gitignore
└── README.md
```

## 6. Implementation Progress

### Phase 1 — Distributed Infrastructure

- [x] Ubuntu Server environment preparation.
- [x] Docker installation and configuration.
- [x] Custom Docker image with Hadoop and Spark.
- [x] Hadoop configuration.
- [x] HDFS NameNode and DataNode deployment.
- [x] YARN ResourceManager and NodeManager deployment.
- [x] Spark History Server configuration.
- [x] Master/Worker cluster deployment.
- [x] HDFS storage validation.
- [x] YARN worker registration validation.
- [x] Distributed SparkPi application successfully executed on the Worker.

### Phase 2 — Dataset Integration and Processing

- [ ] Dataset exploration and preparation.
- [ ] Network traffic data ingestion into HDFS.
- [ ] Data cleaning and preprocessing with PySpark.
- [ ] Exploratory data analysis.

### Phase 3 — Intrusion Detection

- [ ] Machine learning model development.
- [ ] Intrusion classification.
- [ ] Model evaluation and performance comparison.
- [ ] Analysis of false positives and false negatives.

### Phase 4 — Finalization

- [ ] Results visualization.
- [ ] Documentation.
- [ ] Final testing and evaluation.

## 7. Infrastructure Validation

The distributed infrastructure has been tested successfully:

- HDFS is operational with one active DataNode.
- YARN successfully registers the Worker node.
- HDFS read/write operations have been validated.
- A SparkPi application was submitted through YARN and completed successfully.
- The Spark History Server records the completed application.
- The Spark Executor successfully executed tasks on the Worker node.

## 8. Deployment

The following commands assume that Docker Engine and Docker Compose are installed on Ubuntu Server.

### Build the Docker image

```bash
sudo docker build -t nids-node:1.2 -f docker/Dockerfile .
```

### Create the Docker network

```bash
sudo docker network create nids-net
```

If the network already exists, this step can be skipped.

### Start the cluster

```bash
sudo docker compose up -d
```

### Check container status

```bash
sudo docker compose ps
```

### Check Hadoop and YARN services

```bash
sudo docker exec nids-master jps
sudo docker exec nids-project-worker-1 jps
sudo docker exec nids-master yarn node -list
```

### Stop the cluster

```bash
sudo docker compose stop
```

## 9. Web Interfaces

Replace `VM_IP` with the current IP address of the Ubuntu Server VM.

| Service | URL |
|---|---|
| HDFS NameNode UI | http://VM_IP:9870 |
| YARN ResourceManager UI | http://VM_IP:8088 |
| Spark History Server | http://VM_IP:18080 |

## 10. Future Improvements

The next development steps will focus on integrating network intrusion datasets, implementing scalable data preprocessing pipelines, and developing machine learning models to detect malicious network activities.

---

**Project Status:** Infrastructure implemented and validated. Data processing and intrusion detection development are ongoing.
