pipeline {
    agent any

    stages {
        stage('Run Tests') {
            steps {
                sh 'bash test.sh'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build('harineemd-static-site')
                }
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker run -d -p 8080:80 harineemd-static-site'
            }
        }
    }
}
