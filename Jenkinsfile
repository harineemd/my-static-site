pipeline {
    agent any
     triggers {
        githubPush() 
    }
    stages {
        stage('Clone Repo') {
            steps {
                git(url: 'https://github.com/harineemd/my-static-site.git', branch: 'main')
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat '''docker build -t my-image .'''
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Stop and remove existing container if any
                    bat '''docker stop my-running-container || exit 0
                          docker rm my-running-container || exit 0
                    '''
                    
                    // Check if port 8090 is in use
                    def portInUse = bat(script: 'netstat -an | findstr 8090', returnStdout: true).trim()
                    
                    if (portInUse) {
                        echo 'Port 8090 is already in use, attempting to run on a different port.'
                        // Optionally, you can dynamically change the port or set a fallback port
                        def fallbackPort = 8091
                        bat "docker run -d -p ${fallbackPort}:80 --name my-running-container my-image"
                    } else {
                        // Run on port 8090 if available
                        bat "docker run -d -p 8090:80 --name my-running-container my-image"
                    }
                }
            }
        }
        stage('Deploy to Render') {
            steps {
                bat 'curl -X POST https://api.render.com/deploy/srv-cvvnso3e5dus73cfupc0?key=nqXddJpr4ig'
            }
        }

    }
}