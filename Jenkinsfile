pipeline {
    agent any
    stages {
        stage('Clone Repo') {
            steps {
                git(url: 'https://github.com/harineemd/my-static-site.git', branch: 'main')
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t my-image .'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Optional: Stop existing container
                    bat '''
                    docker stop my-running-container || true
                    docker rm my-running-container || true
                    docker run -d -p 8090:80 --name my-running-container my-image
                    '''
                }
            }
        }
    }
}
