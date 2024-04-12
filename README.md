# tf-projects

Deploy an Application to Amazon ECS With EC2 | Docker | ECR | Fargate | Load balancer

-- In Bastion
-- create html file and Dockerfile same dir
-- Dockerfile content --
FROM httpd
COPY . /usr/local/apache2/htdocs/

docker build -t webapp .

aws configure
ecr push commands 1, 3, 4

-- Deploying order (ex: terraform apply --target=module.vpc)
vpc > bastion-sg > bas-ec2 > ecr > all