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
                    git 'https://github.com/satinderthakur/11-feb.git'
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
                    docker.withRegistry('https://506844237526.dkr.ecr.ap-south-1.amazonaws.com', 'ecr:ap-south-1:test-ecr-credentials'){
                        docker.image('demo').push('latest')
                    }
                }
            }
        }
        stage('Terraform Apply'){
			steps{
				script{
					bat'''
					
						terraform init
						terraform apply -var-file='D:\Activity\Newfolder\terraform.tfvars' -auto-approve
					'''
				}
			}
		}
    }
} 
