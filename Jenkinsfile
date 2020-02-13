pipeline
{
    agent any
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
                                                                                     ssh-keygen -f mykey && echo "yes" 
                                                                                      terraform init
                                                                                      terraform apply -auto-approve
                                                                        '''
                                                          }
                                           }
                             }
        stage('Docker Pull'){
            steps{
                script{
                    bat'''ssh $(terraform output | cut -d "=" -f 2) -l ec2-user -o StrictHostKeyChecking=no -i keys/adikey "eval sudo $(aws ecr get-login --no-include-email --region ap-south-1 | sed -e 's/-e none//g'); docker pull 809367851270.dkr.ecr.ap-south-1.amazonaws.com/demo:latest"'''
                }
            }
        }
        stage('Run Container'){
            steps{
                bat '''
                    ssh $(terraform output | cut -d "=" -f 2) -l ec2-user -o StrictHostKeyChecking=no -i keys/adikey "docker run -itd -p 8080:8080 809367851270.dkr.ecr.us-west-1.amazonaws.com/demo:latest"
                '''
            }
        }
    }
}

