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
                    git 'https://github.com/adityasemwal/ECSdemo.git'
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
        stage('Clean Images'){
            steps{
                sh'''
                    #!/bin/bash
                    echo "hello"
                '''
            }
        }
        stage('Docker Pull'){
            steps{
                script{
                    docker.withRegistry('https://809367851270.dkr.ecr.us-west-1.amazonaws.com', 'ecr:us-west-1:test-ecr-credentials'){
                        sh 'docker pull 809367851270.dkr.ecr.us-west-1.amazonaws.com/demo:latest'
                    }
                }
            }
        }
        stage('Run Container'){
            steps{
                sh '''
                    #!/bin/bash
                    docker run -itd -p 8080:8080 809367851270.dkr.ecr.us-west-1.amazonaws.com/demo:latest
                '''
            }
        }
    }
}