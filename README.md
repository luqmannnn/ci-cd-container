# ci-cd-container

# ECS Fargate simple creation


### What is ECS? 
![image](https://github.com/luqmannnn/ecs-fargate/assets/9068525/dd4608c3-5f42-48f0-9d69-73c73d872d4a)

Amazon Elastic Container Service (Amazon ECS) is a fully managed container orchestration service that helps you easily deploy, manage, and scale containerized applications. As a fully managed service, Amazon ECS comes with AWS configuration and operational best practices built-in. It's integrated with both AWS and third-party tools, such as Amazon Elastic Container Registry and Docker. This integration makes it easier for teams to focus on building the applications, not the environment. You can run and scale your container workloads across AWS Regions in the cloud, and on-premises, without the complexity of managing a control plane.

AWS Fargate is a technology that you can use with Amazon ECS to run containers without having to manage servers or clusters of Amazon EC2 instances. With Fargate, you no longer have to provision, configure, or scale clusters of virtual machines to run containers. This removes the need to choose server types, decide when to scale your clusters, or optimize cluster packing.

### ECS Infrastructure
There are three layers in Amazon ECS:

1. Capacity - The infrastructure where your containers run
2. Controller - Deploy and manage your applications that run on the containers
3. Provisioning - The tools that you can use to interface with the scheduler to deploy and manage your applications and containers

![image](https://github.com/luqmannnn/ecs-fargate/assets/9068525/6bee02a3-0d3a-4bf1-becf-c700f62aa5fb)


More information: https://docs.aws.amazon.com/AmazonECS/latest/userguide/what-is-fargate.html & https://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html

### Activity
Here, we will be creating a simple ECS Fargate service using the latest NGINX image.

## Steps needed to create an ECS Fargate resource:

### Task Definition
You define your applications using a JSON or YAML file called a task definition. This file describes how your application should run, including the Docker image to use, the CPU and memory requirements, network configuration, and more.

It is recommended to use a JSON file, stored under a "files" folder and called by the Terraform resource <b>aws_ecs_task_definition</b>

### ECS Cluster
A cluster is a grouping of container instances (EC2 instances or Fargate tasks) that you manage as a single entity. You can have multiple clusters, each serving different purposes.

This can be done by using the Terraform resource <b>aws_ecs_cluster</b> where you specify the name of the cluster

### ECS Service
A service allows you to define a desired number of tasks running concurrently. ECS ensures that the specified number of tasks are always running and replaces any that fail or become unresponsive.

In Terraform, we can use the resource <b>aws_ecs_service</b> and we will need to specify:
1. network_configuration
2. deployment_circuit_breaker
3. launch_type = "FARGATE"
4. name of service
5. cluster previously created
6. task definition previously created
7. desired count that you wish

### End Goal
Once everything has been successfully created, we will be able to access the ECS endpoint under Service > Tasks from the console, which should look like this:
<img width="577" alt="Screenshot 2023-10-02 at 1 52 57 AM" src="https://github.com/luqmannnn/ecs-fargate/assets/9068525/51da93d5-324d-4a8f-b690-0d521cf0f775">


### What else could I do more of?
1. <b> Creating own Docker image </b>: You can think about creating your own Docker image and spinning up an ECR private registry to store this docker image, which will then be injected into the Task Definition instead
2. <b> Creating networking layer from scratch </b>: Build your own VPC, Subnets and Security groups from scratch to have more control over your infrastructure

### Clean Up
Tear down your infrastructure using Terraform, or if you are manually provisioning this, do so in the below format:
1. Service
2. ECS Cluster
3. Task Definition