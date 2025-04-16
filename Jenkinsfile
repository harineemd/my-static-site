pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/harineemd/my-static-website.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t my-image .'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Optional: Stop existing container
                    sh '''
                    docker stop my-running-container || true
                    docker rm my-running-container || true
                    docker run -d -p 8090:80 --name my-running-container my-image
                    '''
                }
            }
        }
    }
}
