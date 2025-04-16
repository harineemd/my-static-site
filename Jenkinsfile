pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // For Windows, use the bat command
                    bat 'docker build -t my-image .'
                }
            }
        }
        stage('Run Container') {
            steps {
                script {
                    // Use bat for running containers on Windows
                    bat 'docker run -d -p 8080:80 my-image'
                }
            }
        }
    }
}