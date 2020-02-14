pipeline
{
    agent {label "docker"}
    stages
    {
        stage('Checkout'){
            steps
            {
                script
                {
                    git 'https://github.com/adityasemwal/aws_terraform.git'
                }
            }
        }
        stage('Docker Build'){
            steps{
                script{
                    docker.build('demo')
                }
            }
        }
        stage('Docker Push'){
            steps{
                script{
                    docker.withRegistry('https://809367851270.dkr.ecr.us-west-1.amazonaws.com', 'ecr:us-west-1:test-ecr-credentials'){
                        docker.image('demo').push('latest')
                    }
                }
            }
        }
        stage('Terraform Apply'){
			steps{
				script{
					sh'''
						#!/bin/bash
						terraform init
						terraform apply -var-file=/home/jenksin/terraform.tfvars -auto-approve
					'''
				}
			}
		}
    }
} 
