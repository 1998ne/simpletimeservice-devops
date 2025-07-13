#  Particle41 DevOps Challenge – SimpleTimeService

Welcome to the Particle41 DevOps Challenge submission by Neha Patil. This repository demonstrates a DevOps-ready deployment of a minimal microservice called `SimpleTimeService`, containerized using Docker, and deployed to AWS ECS using Terraform.

---

##  Purpose of This Project

This challenge demonstrates:
- Minimalist application development
- Containerization best practices (non-root user, lightweight image)
- Terraform-based Infrastructure-as-Code (IaC)
- AWS ECS (Fargate), ALB, VPC, IAM
- Clean, complete documentation for ease of reuse by any team member

---

##  Repository Structure

├── app/ # Contains Flask application and Dockerfile
│ └── main.py
│ └── Dockerfile
├── Terraform/ # Contains Terraform IaC to deploy service on AWS ECS
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ └── terraform.tfvars
└── README.md # You are here!



---

##  Task 1 – Application Development, Dockerization

### SimpleTimeService API

This is a minimal Flask web server that returns a JSON response with:
- Current UTC timestamp
- The IP address of the request origin

Example response:

```json
{
  "timestamp": "2025-07-11 19:15:00",
  "ip": "203.0.113.42"
}

 Dockerfile Highlights

- **Lightweight base image** (`python:3.9-slim`)
- **Runs as a non-root user**
- **Port 5000** exposed
- **Entrypoint:** `gunicorn` for **production-readiness**


** Build and Run Locally**
 **Prerequisites**
  Docker

** Build Image**

cd app
docker build -t simpletimeservice .

▶**Run Container**

docker run -d -p 5000:5000 patilneha/simpletimeservice:latest

** Test Endpoint**

curl http://localhost:5000/time

** Task 2 – Terraform Infrastructure on AWS**
This Terraform setup creates:

A custom VPC with 2 public and 2 private subnets

An Application Load Balancer in public subnets

ECS cluster with Fargate tasks in private subnets

IAM roles, security groups, networking

Your Dockerized app deployed in ECS behind ALB

** Prerequisites**
Terraform

AWS CLI
AWS credentials configured:
aws configure

Deploy with Terraform
cd Terraform

terraform init
terraform plan
terraform apply

After a few minutes, Terraform will output your load balancer DNS:
alb_dns_name = simpletimeservice-alb-xxxxxxx.elb.amazonaws.com
Visit:
http://<alb_dns_name>/time

 **Security & Best Practices*
1) Application runs as non-root inside Docker

2) Secrets are NOT committed to the repository

3) IAM roles use least-privilege policies

4) Lightweight container image (~209MB)

5) Clean infrastructure teardown supported via terraform destroy


 **Links**
 GitHub Repo: https://github.com/1998ne/simpletimeservice-devops

 Docker Hub: https://hub.docker.com/r/patilneha/simpletimeservice

 Extra Credit Opportunities (Optional)
While not required, here’s how this project could be extended:

Add S3 + DynamoDB backend for remote Terraform state

Add GitHub Actions for CI/CD pipeline (build → push → deploy)

Use Terraform modules for reusability (e.g., ECS module)

👩‍💻 Author
Neha Patil
DevOps Engineer | Cloud Enthusiast | Terraform Practitioner
GitHub | Docker Hub 
