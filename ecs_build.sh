#!/bin/bash

# Install Docker runtimes
sudo yum -y install docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

# Fetch ECS image build from paramter store (if needed)
if [ ! -f "build_docker_image.sh" ]; then
    aws ssm get-parameter  --region us-west-2 --output text --query Parameter.Value --name build_docker_image.sh > build_docker_image.sh;
    chmod +x build_docker_image.sh;
fi

# Run script
./build_docker_image.sh;

