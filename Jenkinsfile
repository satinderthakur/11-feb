pipeline {
    agent any
     stages {
        stage('Build') {
            steps {
                bat "docker build -t myimage2 ."
            }
        }
        stage('Test') {
            steps {
                bat "mvn test"
            }
        }
        stage('Deploy') {
            steps {
                bat "mvn package"
            }
        }
    }
}
