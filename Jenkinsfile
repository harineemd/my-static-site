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
                    // Stop and remove existing container if any
                    bat '''
                    docker stop my-running-container || exit 0
                    docker rm my-running-container || exit 0
                    docker run -d -p 8090:80 --name my-running-container my-image
                    '''
                }
            }
        }
    }
}
